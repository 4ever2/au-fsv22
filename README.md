# au-fsv
Docker container for courses based on the [Software Foundations](https://softwarefoundations.cis.upenn.edu/) book.
The container can be used for easy cross-platform Rocq development using Visual Studio Code.
The container configuration will automatically install the VsRocq extension for Visual Studio Code and configure Rocq-related settings.

The image uses Rocq/Coq 9.0.0 and includes *all dependencies* needed to complete the following Software Foundations volumes:
* [Logical Foundations (Volume 1)](https://softwarefoundations.cis.upenn.edu/lf-current/index.html)
* [Programming Language Foundations (Volume 2)](https://softwarefoundations.cis.upenn.edu/plf-current/index.html)
* [Verified Functional Algorithms (Volume 3)](https://softwarefoundations.cis.upenn.edu/vfa-current/index.html)
* [QuickChick: Property-Based Testing in Coq (Volume 4)](https://softwarefoundations.cis.upenn.edu/qc-current/index.html)
* [Separation Logic Foundations (Volume 6)](https://softwarefoundations.cis.upenn.edu/slf-current/index.html)


## Setup
1) [Install Docker](https://www.docker.com/get-started/)
2) Make sure Docker is running
3) [Install Visual Studio Code](https://code.visualstudio.com/Download)
4) [Install Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
5) Copy the `.devcontainer` folder to the root of your project folder

After following the above instructions open your project in Visual Studio Code and run the `Remote-Containers: Reopen in Container` command.
If the instructions are followed correctly Visual Studio Code should also automatically suggest opening the repository in container mode when the project is loaded.

## System requirements
See [here](https://code.visualstudio.com/docs/remote/containers#_system-requirements)

## Known problems
### VSCode shows `Docker returned an error`
Make sure that Docker is installed and running.

### The `Remote-Containers: Reopen in Container` command is not recognized by VSCode
You need to have the Remote - Containers extension VSCode extension installed and enabled.
See [here](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) for instructions on how to install it.

### Running `Remote-Containers: Reopen in Container` cannot find the container
Make sure you copied the `.devcontainer` folder to your project's root folder and that it includes the `devcontainer.json` file.

### `Cannot find a physical path bound to logical path X with prefix Y` when importing a file
* Make sure that the Rocq files have been compiled. Run `make` to compile the project files.
* If the `_CoqProject` files are not located in the project root folder you need to either
  * Move the files to the root project folder
  * Or add the line `"coq.coqProjectRoot": "PATH_TO_COQPROJECT"` (in `.devcontainer/devcontainer.json` to point to the directory where `_CoqProject` is located. Restarting the docker container is required after this step.

### Docker pull rate limit hit
Docker Hub rate limits pulls of images for free accounts to 200 per six hours.
If this limit is hit you might get one of the following errors and have to wait until the rate limit resets.
* `ERROR: toomanyrequests: Too Many Requests`
* `You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limits`


## FAQ
### What is included in the Docker image?
The Docker image used for the devcontainer is built using the [Dockerfile](Dockerfile) in this repository and hosted on Docker Hub. It is based on the [rocq/rocq-prover:9.0.0-ocaml-4.14.2-flambda](https://hub.docker.com/layers/rocq/rocq-prover/9.0.0-ocaml-4.14.2-flambda/images/sha256-a147c13cf25366f8c660745354f2afb1b64705ed2d645b561b82db83895745a0) image, which includes the following:
* Debian 12 Slim
* opam 2.3.0
* OCaml 4.14.2
* Rocq 9.0.0
* coq-quickchick 2.1.1
* coq-ext-lib 0.13.0
* rocq-equations 1.3.1+9.0
* vscoq-language-server 2.2.6
