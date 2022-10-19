`terraform workspace new workspace_name`  
`terraform workspace select workspace_name`  
`terraform workspace list`  
`terraform workspace show`  

# To select a tfvars file upon plan or apply
`terraform plan -var-file dev.tfvars -out=my_plan.tfplan`  
`terraform plan -var-file prod.tfvars -out=my_plan.tfplan`  

# To apply
`terraform apply my_plan.tfplan`  

# To destroy
`terraform destroy -var-file dev.tfvars`  

# Project Instructions

## VPC
---
Note: Create and provision the VPC module in order to make it available for the rest of the project.  


## Subnet
This is where we can deploy our EC2 instances.

## Route Tables
This is to route traffic from the subnets to the Internet Gateway or internally

## EC2 
To find out about the owner for an ami:  
1. Log into aws console  
2. Choose an ami from the ec2 catalog  
3. Click on **Images**  
4. Click on Amazon Machine Images (AMIs) --> Public images, paste it and check **Owner**  

**Note:** In this case, once I run terraform plan from the 6-data_sources.tf file, there are no changes
since I'm using dev.tfvars and the ***ami*** value is provided there also.

### Create ssh key-pair to interact with the EC2 instance
1. In the terminal type: `ssh-keygen -t ed25519`
2. Enter file name by previously copying the path and then give it a proper path+name ei. `/Users/me/.ssh/dev-env-key`
3. 