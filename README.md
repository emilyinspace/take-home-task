
# take-home-task
In the file `instructions.md` reside the original instructions. In the file `manual.md` are the steps necessary to test this repository's code. A `Makefile` is also provided to skip some time.

The file `terraform.md` has the output of `terraform-docs` for a brief understanding. Let's split the logic of this project in sections.

## Infrastructure creation
Firstly, let's focus on the `*.tf` files.  

### networking.tf
The `networking.tf` file firstly contains the creation of a VPC. Then, we create an internet gateway that acts as a logical connection between the VPC and the internet. There, is also created an Elastic IP which gets allocated on a NAT Gateway. 

The NAT Gateway is necessary in order to receive traffic from the VPC and forward it to the internet. That means that this NAT Gateway needs to be on the public subnet.

 We then create 2 subnets, one for public connection (traffic gets routed to the internet gateway), and one for private connection (traffic gets routed to NAT Gateway).

The "public" route is assigned to the VPC, with internet gateway as its gateway, while the "private" route is assigned to the NAT Gateway. Both routes get the whole internet CIDR block (0.0.0.0/0) as destination.

We finally associate each route table to the related subnet and a security group gets created in order to allow all outbound traffic for our VPC and its resource, and allow incoming HTTP and SSH traffic to test our web application and to be able to connect to the VM. 

### virtual_machine.tf
The `virtual_machine.tf` file contains a `aws_ami` data resource, which was used to determine and choose the target AMI ID. This ensures that during our testings, the same OS version will be used. 

Then, we create an EC2 instance that gets a private IP that we will not use for our purposes. It also gets assigned on the public subnet ID and gets related to the default security group we create.

### outputs.tf
This file contains just a few outputs that we can use for our own assistance, like, getting the public IP of the VM after creation.

### variables.tf
It contains a few variables. Aside from changing the AWS region, the rest are some CIDR blocks for our networking resources, a custom tag to find what we created easier etc.

### providers.tf
It contains the information about the provider used (AWS), and which version of terraform needs to be used with this repo.

## Web Application
The application (and its files) are in the `webapp` directory. The `requests` library is used for the GET requests. `Flask` is used for serving the HTML template needed. The app gets configured to listen on all interfaces, but that isn't necessary.

The `Dockerfile` used vanilla alpine to install `python3` and `pip`, install the project's dependencies on the docker image. Hence, why we use the `RUN` statements.

 The `entrypoint.sh` file is used when the docker container will run. It simply activates the python virtual environment and run the web app.

##  Provisioning / Deployment
Two ansible playbooks are needed for setting up the VM just after it gets created through terraform. The first, `provision.yml` follows the official steps to install docker, and nginx as we need it to be present. The default `ubuntu` user also gets permission to connect to the docker daemon, by getting added to the `docker` group.

The second playbook `deployment.yml` copies the webapp files, creates the docker image based on the `Dockerfile`, then starts a docker container from that, installs a nginx config to work as proxy.

