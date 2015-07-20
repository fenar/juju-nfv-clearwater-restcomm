# VNF workload modeling using Juju

Juju is a generic Virtual Network Function Manager (VNFM) in the ETSI NFV architecture and can be integrated with  Network Function Virtualization Orchestrator (NFV-O). 

Juju is a universal service modelling system, it models services, their relationships and scale, independent of substrate (cloud, virtualised or physical).




## Telco demo deployment

Works on Amazon EC2 and OpenStack 

Download this project:

    git clone https://github.com/thomnico/juju-nfv-clearwater-restcomm.git

Once you juju environment is up (suggesting juju-quickstart https://launchpad.net/juju-quickstart ):

    ./00-prepare.sh

If you have a dns domain of your own you can change the first 2 lines of bundle-nfv-demo.yaml in the override section.

    ./01-deploy.sh


## Using the deployment:

For the familiar with IMS word here is the ClearWater architecture:
-![alt text](http://www.projectclearwater.org/wp-content/uploads/2013/05/project-clearwater-architecture-april-2014-2.png "Clearwater architecture")


Use clearwater by using: 

* the login at: http://ellis-IP/
* Go to signup page:
    * e-mail/name: your choice.
    * signup code : `abracadabra`
    * password suggestion: `AAbbCCdd`


Use restcomm using the login at: `http://restcomm-IP:8080/restcomm-management`
* email: `administrator@company.com`
* pass: `RestComm`

Show the designer: 
http://www.restcomm.com/developers/

## Deploy and connect to juju GUI

    juju-quickstart 

## Example of VNF model orchestration using Zabbix

In order to show real deployment and orchestration use case we need external machine (to current Juju environment) to deploy orchestration service. 
In this example we will use Zabbix server. [to do describe deployment of zabbix] 

Follow the steps: 

### Connect external Zabbix server

* You must open the following port 80 (interface), 10050 et 10051 (zabbix)

* Create a security group if on AWS or OpenStack to ensure you can connect to and be sure you can access that machine/vm.

* Then simply do (of course use your IP):

  `./install-on-machine 54.164.161.172`

If blocked with a "Cleaning" msg .. kill and restart (it should be idempotent)

* Then  `http://54.164.161.172/zabbix/` 
login admin / ubuntu

### Connect your Juju environment and agents
  
Once started and if you create a Zabbix machine run:
 
`integrate-with-ext-zabbix <IP of the zabbix machine>`


### Bulk user creation
Run:  `BulkUsersCreation.sh` 

## Clean enviroment  
When you done, you can clean ennviroment and destroy all services (do not terminate machines). 

    juju-deployer -D 
