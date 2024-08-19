# PseudoSweep Tool Demo 

This is an example repo to demonstrate a use case of the PseudoSweep Tool. A video demonstration is available [here](https://youtu.be/5QCsu7MbiXI).

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
   current directory. (Triangle is included for example purposes)
4. Add PseudoSweep as a dependency to the pom.xml file as per instructions in [PseudoSweep](https://github.com/PseudoTested/PseudoSweep).

5. Configure `run-pseudosweep.sh` for the given project. This includes the
   build tool commands and specifying which files you would like PseudoSweep
   to evaluate.

6. Run `bash run-pseudosweep.sh <project-name>`

