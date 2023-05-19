#!/bin/bash
echo "First we need to configure access to AWS to be able to deploy resources."
echo ""
echo "The account being configured needs access to deploy:"
echo "    * EC2 instances"
echo "    * Security groups"
echo "    * Subnets"
echo "    * EBS volumes"
echo ""
echo "Please enter the needed information"
echo "Press ENTER to skip a variable and let it's value unchanged"
echo ""
echo "Enter the AWS Access Key for the AWS account:"
read acckey
if [ "$acckey" != "" ]
then
  sed -i "s/var_aws_access_key:.*/var_aws_access_key: \"${acckey//\//\\/}\"/gi" variables.yml
  echo "AWS Access Key value updated"
else
  echo "AWS Access Key value NOT updated"
fi
echo ""
echo "Enter the AWS Secret Key for the AWS account:"
read seckey
if [ "$seckey" != "" ]
then
  sed -i "s/var_aws_secret_key:.*/var_aws_secret_key: \"${seckey//\//\\/}\"/gi" variables.yml
  echo "AWS Secret Key Value updated"
else
  echo "AWS Secret Key Value NOT updated"
fi
echo ""
echo "Enter the AWS region where the resources will be deployed:"
read awsregion
if [ "$awsregion" != "" ]
then
  sed -i "s/var_aws_region:.*/var_aws_region: \"${awsregion}\"/gi" variables.yml
  echo "AWS region updated"
else
  echo "AWS region NOT updated"
fi
echo ""
echo "Enter the VPC ID where the resources will be deployed:"
read vpcid
if [ "$vpcid" != "" ]
then
  sed -i "s/var_vpc_id:.*/var_vpc_id: \"${vpcid}\"/gi" variables.yml
  echo "VPC ID updated"
else
  echo "VPD ID NOT updated"
fi
echo ""
echo "Enter subnet address space in CIDR notation (eg. 172.100.100.0/24) that fits in the vpc"
read sncidr
if [ "$sncidr" != "" ]
then
  sed -i "s/var_subnet_cidr:.*/var_subnet_cidr: \"${sncidr//\//\\/}\"/gi" variables.yml
  echo "Subnet Address updated"
else
  echo "Subnet Address NOT updated"
fi
