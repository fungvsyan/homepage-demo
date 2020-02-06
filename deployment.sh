#
echo "Launching VPC..."
aws cloudformation deploy --template-file cf_template/Launch_VPC.yaml --stack-name Demo-VPC-Stack \
--parameter-overrides VpcCIDR=10.0.0.0/16 ProjectName=Demo Subnet01CIDR=10.0.0.0/24

echo "Launching Instance..."
aws cloudformation deploy --template-file cf_template/Launch_Ec2.yaml --stack-name Demo-Instance-Stack \
--parameter-overrides NetworkStackName=Demo-VPC-Stack EC2InstanceType=t2.micro EC2InstanceKey=demo-use --capabilities CAPABILITY_IAM

