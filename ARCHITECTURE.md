# Architecture

This document describes the high-level architecture of the repository. If you want to familiarize yourself with the code base, you are just in the right place!

## Bird's Eye View

On the highest level, aws-cfn-unique-resource-names is a reference repository for an artifact, which means that the repository is mainly built around example source files.

```text
.
├── build
├── cloudformation
│   ├── 01-empty
│   │   └── stack.template.yaml
│   ├── 02-properties
│   │   └── stack.template.yaml
│   ├── 03-override-for-props
│   │   └── stack.template.yaml
│   └── README.md
├── docs
│   └── README.md
├── Makefile
└── README.md
```

## Code Map

This section talks briefly about various important directories and data structures.

### `.gitpod`

The configuration for the Development container, which is used to create a full-feature development environment on the gitpod service.

### `.vscode`

VS Code configuration.

### `cloudformation`

The source for the CloudFormation templates which demonstrate the usage of the pseudo predefined cloudformation variables.

### `docs`

Documentation of the repository.
