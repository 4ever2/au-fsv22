# au-fsv22
Docker container for courses based on the Software Foundations book.
The container can be used for easy cross-platform Coq development using Visual Studio Code.

The image uses Coq 8.15.2 and includes *all dependencies* needed to complete the following Software Foundations volumes
* Logical Foundations (Volume 1)
* Programming Language Foundations (Volume 2)
* Verified Functional Algorithms (Volume 3)
* QuickChick: Property-Based Testing in Coq (Volume 4)
* Separation Logic Foundations (Volume 6)


## Setup
* [Install Docker](https://www.docker.com/get-started/)
* [Install Visual Studio Code](https://code.visualstudio.com/Download)
* [Install Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
* Copy the `.devcontainer` folder to your project folder

After following the above instructions open your project in Visual Studio Code and run the `Remote-Containers: Reopen in Container` command.
If the instructions are followed correctly Visual Studio Code should also automatically suggest opening the repository in container mode when the project is loaded.

## FAQ
### VSCode shows `Docker returned an error`
Make sure that Docker is installed and running.

### The `Remote-Containers: Reopen in Container` is not recoqnized by VSCode
You need to have the Remote - Containers extension VSCode extension installed and enabled.
See [here](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) for instructions on how to install it.

### Running `Remote-Containers: Reopen in Container` cannot find container
Make sure you copied the `.devcontainer` folder to your projects root folder and that it includes the `devcontainer.json` file.

### `Cannot find a physical path bound to logical path X with prefix Y` when importing file
* Make sure that the Coq files have been compiled. Run `make` to compile the project files.
* If the `_CoqProject` files is not located in the project root folder you need to either
  * Move the files to the root project folder
  * Or change the line `"coq.coqProjectRoot": "."` (in `.devcontainer/devcontainer.json` to point to the directory where `_CoqProject` is located. Restarting the docker container is required after this step.


## Known proplems
