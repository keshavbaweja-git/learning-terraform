# learning-terraform

This is a sample project implementation to manage AWS infrastructure as code. The project uses Terraform from HashiCorp as the tool to manage AWS infrastrucutre. Currently there is one project folder `learn_vpc` that includes implemenation of following AWS resources -

1. Virtual Private Cloud (VPC)
2. Public Subnet
3. Private Subnet
4. Internet Gateway
5. NAT Gateway
6. Security Group
7. Routing Table
8. Elastic IP address (EIP)
9. EC2 instance

## Prerequisites

1. AWS Account <br>
Create an AWS Free Tier account if you don't have one already. 

2. An AWS IAM user with Administrator access <br>
For points 1. and 2. above, please refer to [instructions here](https://docs.aws.amazon.com/translate/latest/dg/setting-up.html)

3. Generate and download access key and secret key for the user created above.

4. Set up AWS CLI, please refer to [instructions here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)

5. Generate an SSH key pair on AWS console, this SSH key pair will be used to login into EC2 instance in Public Subnet. Please refer to [instructions here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

6. Install Terraform, Please refer to [instructions here](https://www.terraform.io/intro/getting-started/install.html)

## Running the project
After you have cloned the repository on your machine, run the commands below
```
cd learn_vpc
terraform init # this initializes Terraform by downloading AWS provider plugins
terraform apply # analyses the configuration files and applies the changes to AWS infrastrucuture
```




