Task - 1  
Create the following Terraform modules and configure the root module to use them: 
Networking Module 
Description: Manages the creation of networking resources. 
Components: 
VPC: Virtual Private Cloud. 
Public Subnets: 2 subnets. 
Private Subnets: 2 subnets. 
Route Tables: 2 route tables.

Task 2 
Continue with the previous task add below modules also. 
Security Module 
Description: Manages the creation of security groups. 
Components: 
Public Security Group: For public instances with only SSH port open. 
Private Security Group: For private instances with only SSH port open. 
Compute Module 
Description: Manages the creation of instances. 
Components: 
Public Instances: Launch instances in the public subnet. 
Private Instances: Launch instances in the private subnet.
