# Development Container Image

<table style="width: 100%; border-style: none;">
<tr>
    <td style="width: 140px; text-align: center;">
        <a href="https://gitpod.io/#https://github.com/the-aeydr/aws-cfn-unique-resource-names">
            <img 
                width="128px"
                src="https://avatars.githubusercontent.com/u/37021919?s=200&v=4"
                alt="gitpod organization logo"/>
        </a>
    </td>
    <td>
        <strong>GitPod Development Container</strong><br />
        Spin up fresh, automated dev environments for each task, in the cloud, in seconds.<br />
        Looking to get started? <a href="https://gitpod.io/#https://github.com/the-aeydr/aws-cfn-unique-resource-names">Open in Gitpod.io</a>
    </td>
</tr>
</table>

A **development container** is a running [container](https://opencontainers.org/) with a defined runtime stack and opinionated configuration for installing toolchains. It allows for _reproducible_ full-featured development environments that can be be used to develop, test, or run an application.

This repository supports a GitPod development container image which is built by [workspace images](https://www.gitpod.io/docs/configure/workspaces/workspace-image).

## Contents
 
- [`/.gitpod.yml`](../.gitpod.yml) - A symlink in the repository root to the `.gitpod/.gitpod.yml` file
- [`.gitpod.yml`](.gitpod.yml) - Defines the configuration of the development environment

## Common Questions

### What is Gitpod.io?

Repositories often have complicated development environments that can take time to set up, which can make getting started challenging. The typical process involves following documentation that is composed of installation commands and _hoping_ that no errors occur. This way of setting up development environments can be time consuming, error prone, and may not replicate the configuration accurately to enable contribution to a project.

GitPod is an ephemerial/adhoc developer environment that instantiates a containerized cloud environment. These environments can come with preinstalled prerequisites based on container images or configuration files. At it's core, it can be seen as a VS Code integration that lets you work within a container.

The [Development Containers](https://containers.dev/) specification summarizes these types of environments as:

> A Development Container (or Dev Container for short) allows you to use a container as a full-featured development environment. It can be used to run an application, to separate tools, libraries, or runtimes needed for working with a codebase, and to aid in continuous integration and testing. Dev containers can be run locally or remotely, in a private or public cloud.

### How can I get started?

Click the button below to start a new development environment:

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/the-aeydr/aws-cfn-unique-resource-names)

### What is the `.gitpod.yml`?

A `gitpod.yml` file is similar to `launch.json` for debugging, but designed to customize a development container within [gitpod](https://gitpod.io). Development containers can be launched for projects that don't have a `.gitpod.yml` file.

This file is expected to be at the repository root, as it is where [gitpod](https://www.gitpod.io/docs/references/gitpod-yml) looks for the configuration file. This repository uses a symlink between `/.gitpod.yml` and `.gitpod/.gitpod.yml` to group the gitpod documentation & configuration files together.