---
type: docs
title: "Radius local dev environments"
linkTitle: "Local environments"
description: "Run Radius applications locally on your machine"
weight: 100
---

## Overview

With a Radius local environment you can run your applications on your machine without the need for an Azure subscription or remote Kubernetes cluster. This makes it easy to develop applications and try them out without waiting for a full deployment to the cloud.

## Features

### Managed cluster runtime

A Radius local environment automatically creates a local Kubernetes cluster for you on top of Docker, making it easy to get up and running with an application runtime. This removes the need to manually setup and maintain a Kubernetes cluster.

Use `rad env init dev` to create an environment.

### Local container registry

One of the slowest parts of working with containers can be waiting for container images to upload and download to remote registries. A Radius local environment automatically creates and manages a local container registry, making it easy to quickly transfer images into your local environment runtime.

### Stream logs

When you run an application locally the logs of your services are output to the terminal.

### Deploy Azure resources

If you configure the optional [Azure provider]({{< ref providers >}}) you can include Azure resources in your application, which will be deployed to the subscription and resource group you specify. This allows you to run your services locally while connnecting to cloud resources.

## Try a local environment

### Prerequisites

- [rad CLI]({{< ref "getting-started#install-radius-cli" >}})
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [k3d](https://k3d.io/)

### Create a local dev environment

You can easily get up and running with a local environment with the `rad env init dev` command:

```sh
rad env init dev
```

This will initialize a local Kubernetes cluster within Docker, along with a local container registry, Radius control-plane, and supporting services.

### Run applications in the local environment

Once you have a local environment, you can run Radius applications in it with the `rad app run` command:

```sh
rad app run
```

## Example

Check out the [Container Apps Store reference app]({{< ref container-app-store >}}) to try out a local dev experience.

{{< button text="Container Apps Store" page="container-app-store" color="success" newtab="true" >}}

## Learn more

- [rad CLI reference]({{< ref cli >}})