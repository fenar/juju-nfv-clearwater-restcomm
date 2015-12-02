# VNF workload modeling using Juju

Juju is a generic Virtual Network Function Manager (VNFM) in the ETSI NFV architecture and can be integrated with a Network Function Virtualization Orchestrator (NFV-O). 

Juju is a universal service modelling system, it models services, their relationships and scale, independent of substrate (cloud, virtualised or physical).

## Telco demo deployment

Works on Amazon EC2 and OpenStack 

- Download this project: `git clone https://github.com/thomnico/juju-nfv-clearwater-restcomm.git`
- Create a Juju environment (we suggest using [juju-quickstart](https://launchpad.net/juju-quickstart))
- If you have a DNS domain of your own, you can change the first 2 lines of bundle-nfv-demo.yaml (in the override section).
- Run `./00-prepare.sh` and `./01-deploy.sh`

## Using the deployment:

For the familiar with IMS world here is the Clearwater architecture:
-![alt text](http://www.projectclearwater.org/wp-content/uploads/2013/05/project-clearwater-architecture-april-2014-2.png "Clearwater architecture")

Use Clearwater by using: 

* the login at: http://ellis-IP/ (use `juju status clearwater-ellis` or the GUI)

* Go to signup page:
    * e-mail/name: your choice.
    * signup code : `abracadabra`
    * password suggestion: `AAbbCCdd`


Use Restcomm using the login at: `http://restcomm-IP:8080`
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

* You must open the following ports:
    * 80 (HTTP)
    * 10050-10051 (Zabbix)

* Create a security group if on AWS or OpenStack to ensure you can connect to and be sure you can access that machine/vm.

* Then simply do (of course use your IP):

  `./install-on-machine 54.164.161.172`

If blocked with a "Cleaning" msg .. kill and restart (it should be idempotent)

* Then  `http://54.164.161.172/zabbix/` 
login admin / ubuntu

### Connect your Juju environment and agents
  
Once started and if you create a Zabbix machine run:
 
`integrate-with-ext-zabbix <IP of the zabbix machine>`

### Wanna test autoscaling?

This project includes the ability to generate simulated load against the system - the equivalent of
40,000 subscribers making two calls an hour.

To do this:

* provision the 40,000 subscribers by running ./StressTestUserCreation.sh
* create a relation between clearwater-bono and clearwater-sipp

After about 8 minutes, CPU load average on Sprout will rise high enough for Zabbix to trigger a
scale-up - you should be able to see this both on the graphs in Zabbix, and as a second node in the
Juju GUI.

## Clean enviroment  
When you are done, you can clean the enviroment by running:

    ./02-reset.sh

This removes all the Clearwater services, but keeps the Juju GUI in place. (It also doesn't destroy
the external Zabbix, so you only need to run `integrate-with-ext-zabbix <IP of the zabbix machine>`
on future runs).
