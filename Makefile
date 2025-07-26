# Sane defaults
SHELL := /bin/bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

.DEFAULT_GOAL: _DEFAULT
.PHONY: _DEFAULT
_DEFAULT: ; @echo -n ""
# ---------------------- Includes ---------------------------
ifdef GLOBAL_MAKEFILE_LIBRARY
  include $(wildcard $(GLOBAL_MAKEFILE_LIBRARY)/*.mk)
endif

# ---------------------- COMMANDS ---------------------------
# Default params
STACK_NAME ?= aws-cfn-unique-resource-names
PARAMETERS ?= 

.PHONY: cfn-init
cfn-init: # Initialize a CloudFormation Stack with no resources 
	@aws cloudformation deploy \
		--template-file cloudformation/01-empty/stack.template.yaml \
		--stack-name $(STACK_NAME)

.PHONY: cfn-describe
cfn-describe: # Describe the CloudFormation stack
	@aws cloudformation describe-stacks \
		--no-cli-pager \
		--stack-name $(STACK_NAME) \
		--output table

.PHONY: cfn-destroy
cfn-destroy: # Teardown the CloudFormation stack 
	@aws cloudformation delete-stack \
		--stack-name $(STACK_NAME)

.PHONY: cfn-props
cfn-props: # Provision a CloudFormation Stack with a set of uniqueness properties
	@time=$$(date +'%Y%m%d%H%M%S')
	@tmpfile=$$(mktemp)
	@cp cloudformation/02-properties/stack.template.yaml $$tmpfile
	@sed -i.bak "s/WaitHandle/WaitHandle$${time}/" $$tmpfile

	$(if $(PARAMETERS),$(info Deploying with parameter overrides: $(PARAMETERS)),)
	aws cloudformation deploy $(if $(PARAMETERS),--parameter-overrides $(PARAMETERS),) \
		--template-file $$tmpfile \
		--stack-name $(STACK_NAME)

.PHONY: cfn-override
cfn-override: # Provision a CloudFormation Stack with the StackName output
	@time=$$(date +'%Y%m%d%H%M%S')
	@tmpfile=$$(mktemp)
	@cp cloudformation/03-override-for-props/stack.template.yaml $$tmpfile
	@sed -i.bak "s/WaitHandle/WaitHandle$${time}/" $$tmpfile

	$(if $(PARAMETERS),$(info Deploying with parameter overrides: $(PARAMETERS)),)
	aws cloudformation deploy $(if $(PARAMETERS),--parameter-overrides $(PARAMETERS),) \
		--template-file $$tmpfile \
		--stack-name $(STACK_NAME)
