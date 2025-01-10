# Developing OpenRelik Workers

This repo contains a development environment leveraging VSCode [DevContainers](https://code.visualstudio.com/docs/devcontainers/containers) to get you started with [OpenRelik Worker](https://openrelik.org/docs/architecture/) development.

To follow this guide you need the following two prerequisites installed on your machine:
- VSCode with the [Dev Containers extention](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed
- [Docker](https://www.docker.com/get-started/)

## TL;DR

4 Quick steps will equip you with a fully featured dev environment in which you can live code and see your updates in real time.
1. Clone this repo
2. Run the Dev Container
3. Access OpenRelik in you web browser
4. Creat a new OpenRelik Worker scaffold and start coding

## Instructions

### 1. Clone this repo

In your VSCode workspace clone this repository and change into the ```openrelik-dev``` folder.
```console
git clone https://github.com/daschwanden/openrelik-dev.git

cd openrelik-dev
```

### 2. Run the Dev Container

In your workspace press ```F1```, then run the ```Dev Containers: Open Folder in Container...```

Choose the ```openrelik-dev``` folder when prompted for your choice.

This will start up new workspace running in a ```docker-in-docker``` container under the hood.

During the startup sequence a [Docker Compose](https://docs.docker.com/compose/) environment with OpenRelik installed will automatically be created for you.
For your convenience it automates all the steps outlined in the OpenRelik [Getting Started](https://openrelik.org/docs/getting-started/) guide.

### 3. Access OpenRelik

As soon as Docker Compose has started all the OpenRelik containers you will see the login parameters displayed in the terminal.

Point your browser to [http://localhost:8711](http://localhost:8711) and use the ```admin``` user and the password displayed in your terminal.

> **Save the Password**: Take note of the password as you will see it only once here.

> **Note**: Make sure you use ```http://localhost:8711``` as ```127.0.0.1``` will not work due to CORS restrictions.

### 4. Create new OpenRelik Worker

**Last but not least** we want to add a new OpenRelik Worker.

In a new ```Terminal``` run the following command:

```console
./newWorker.sh <REPLACE_WITH_YOUR_WORKER_NAME>
```

This will do 2 things:
1. Scaffold a fully functional OpenRelik Worker (called ```openrelik-worker-<REPLACE_WITH_YOUR_WORKER_NAME>```) based on the [openrelik-worker-template](https://github.com/openrelik/openrelik-worker-template) repo.
2. Add the instructions to the ```docker-compose.yml``` to run an additonal container with your new OpenRelik Worker.

You can start the live developer environment that will allow you to see your edits in real time by running the following command in the ```openrelik``` folder (the same folder where you find the ```docker-compose.yml``` file).

```console
cd openrelik
docker compose watch
```

You can now use your Workspace to develop your new OpenRelik worker.

As soon as you save your work on any of the files in the ```openrelik-worker-<REPLACE_WITH_YOUR_WORKER_NAME>``` folder the updates will be synchronised into your new OpenRelik Worker container.
