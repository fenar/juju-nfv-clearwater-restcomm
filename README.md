# VNF workload modeling using Juju

Juju is a generic Virtual Network Function Manager (VNFM) in the ETSI NFV architecture and can be integrated with  Network Function Virtualization Orchestrator (NFV-O). 

Juju is a universal service modelling system, it models services, their relationships and scale, independent of substrate (cloud, virtualised or physical).




## Telco demo deployment

Works on Amazon EC2 and OpenStack 

Download this project:

    git clone https://github.com/thomnico/juju-nfv-demo.git

Once you juju environment is up (suggesting juju-quickstart https://launchpad.net/juju-quickstart ):

    ./00-prepare.sh

If you have a dns domain of your own you can change the first 2 lines of bundle-nfv-demo.yaml in the override section.

    ./01-deploy.sh


## Using the deployment:

For the familiar with IMS word here is the ClearWater architecture:
-![alt text](http://www.projectclearwater.org/wp-content/uploads/2013/05/project-clearwater-architecture-april-2014-2.png "Clearwater architecture")


Use clearwater by using the login at:

* http://ellis-IP/
* Go to signup page:
* e-mail/name: your choice.
* signup code : abracadabra
* password suggestion: AAbbCCdd


Use restcomm using the login at:
*http://restcomm-IP:8080/restcomm-management
*email: administrator@company.com
*pass: RestComm

Show the designer: 
http://www.restcomm.com/developers/

## Deploy and connect to juju GUI

    juju-quickstart 

## Example of orchestrating your model with zabbix

### Create a extrnal to juju Zabbix.

You do need a machine external to Juju to show the true integration.
You must open the following port 80 (interface), 10050 et 10051 (zabbix)

Create a security group if on AWS or OpenStack to ensure you can connect to and be sure you can access that machine/vm.

Then simply do:
./install-on-machine 54.164.161.172
Use your IP of course.

If blocked with a "Cleaning" msg .. kill and restart (it should be idempotent)

Then http://54.164.161.172/zabbix/ 
login admin / ubuntu

# connect your JUJU env and agents.
  
Once started and if you create a zabbix machine run:
 
integrate-with-ext-zabbix <IP of the zabbix machine>


## bulk user creation
Run:  BulkUsersCreation.sh 

### Clean enviroment  
When you done, you can clean ennviroment and destroy all services (do not terminate machines). 

    juju-deployer -D 
