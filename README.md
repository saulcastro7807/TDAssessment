# TDAssessment
To run Teradata Assessment exercise:
  * Uncompress .tar.gz file (or download a repository copy)
  * cd assessment/assignments
  * ./runme.sh
  
The script will execute all 3 assignments automatically

# Considerations
  * Tested on a virtual machine under VirtualBox running Ubuntu 22.04
  * Had no time to implement Input Validation
  * Not implemented deployment to Kubernetes Cluster (time and cost constraints)
  * Had no time to implement auth0 token based authentication
  * Needs access_key and secret_key to authenticate with AWS
  * Needs VPC ID and AWS region to know where to deploy resources
  * Needs a subnet cidr address valid within the specified VPC
