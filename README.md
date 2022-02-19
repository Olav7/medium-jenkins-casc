# Jenkins JCasC
Jenkins Configuration as Code

## How to start

To setup Jenkins on a Linux instance:

1. Clone or checkout the repository on the server
2. Rename the file `mjovanc.com` to your domain
3. Modify file (if needed) in `config/jenkins.yml`
4. Make setup_start.sh executable `chmod +x ./setup_start.sh`
5. Run `./setup_start.sh` to install all dependencies and run the server

## Get list of Jenkins plugins

To get a new list of installed plugins on Jenkins copy the code from **get_plugins.groovy** and paste it in Script Console inside Jenkins when logged in. The output will be an ordered list (alphabetically).
The plugins file used for the Docker image is **plugins.txt**. The file defines what plugins should be installed when building the Docker image and should be updated when installing a new plugin. This should in the future be automated to avoid manual administration.

