# compose-dx - A docker compose based toolkit for HCL DX developers

## Preparation

By default HCL DX images run as **dx_user** / **dx_users** .

* uid: 1000
* gid: 1001

When creating volumes please ensure you set write rights accordingly.

For instance:

> mkdir -p core_profile
> chown -R 1000:1001 core_profile
> chmod ug+rwx core_profile

A utility shortahand is (where gnu make is available)

> make prepare

## Quick setup

### Install tools

The project needs the following tools to operate, use one of the following two methods:

Where make is available:

    make tooling

Manual tooling installation where make is not available:

    brew install just
    brew install direnv

Follow instructions to include direnv opptimization in your shell, then reload terminal sessions to make new tools available

Just is only needed if you intend to use `dxclient` to apply configurations or deploy artifacts to local or remote dx servers.

### Prepare the workspace

After installing the tools:

    direnv allow
    docker login <image registry>
    make prepare

### Startup compose

After preparing the workspace:

    make up

## Operating the tool

Before running docker compose you need to setup the environment. The following command does it for you:

> . ./setEnv.sh

It sources env_default.sh, env_local.sh (user created) and env_images.hs in the shell context so that environment variables are set befor launcing docker.
Not running the environment setup correctly will make startup and other docker-compose commands to fail.

You can use `direnv` to automatically source all the configuration when entering the runtime folder.

Check out the `makefile` file to see the commands you can use for different tasks or just run "make <target>"

## Access the server

When services are started you can access DX and Ring API as:

### Portal
* http://localhost:10039/wps/portal

### Ring API Explorer + Graph QL
* http://localhost:3000/dx/api/core/v1/explorer/
* http://localhost:3000/dx/api/core/v1/graphql

### WebSphere HCL Dx Administrative Console
* https://localhost:10041/ibm/console

### WebSphere Config Wizard Administrative Console
* https://localhost:10203/ibm/console

Note: If this is not working, try replacing localhost with the IP of your machine's network interface
