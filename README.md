# PseudoSweep Tool Demo 

This is an example repo to demonstrate a use case of PseudoSweep.

## Setup
1. Clone this repo and change into the directory using
    ```
    git clone git@github.com:PseudoTested/pseudosweep-demo.git
    cd pseudosweep-demo
    ```
2. Set `PSWCP` to the location of the location of the
   `pseudosweep-0.0.1-SNAPSHOT.jar` file e.g.
    ```
    export PSWCP=/PATH/TO/pseudosweep-demo/pseudosweep-0.0.1-SNAPSHOT.jar
    ```
3. Add the project to evaluate for pseudo-tested statements and methods to the
   current directory.
4. Configure `run-pseudosweep.sh` for the given project. This includes the
   build tool commands and specifying which files you would like PseudoSweep
   to evaluate.
5. Run `bash run-pseudosweep.sh <project-name>`

