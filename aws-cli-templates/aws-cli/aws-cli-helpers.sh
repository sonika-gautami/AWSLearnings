#  --cli-input-yaml
#  --generate-cli-skeleton
#  --debug

#aws cloudformation create-stack --stack-name myteststack \
# --template-body file://sampletemplate.json \
# --parameters ParameterKey=KeyPairName,ParameterValue=TestKey ParameterKey=SubnetIDs,ParameterValue=SubnetID1\\,SubnetID2
# aws cloudformation update-stack --stack-name mystack --template-url https://s3.amazonaws.com/sample/updated.template
#--parameters ParameterKey=VPCID,ParameterValue=SampleVPCID ParameterKey=SubnetIDs,ParameterValue=SampleSubnetID1\\,SampleSubnetID2


#Verify Steps for Mongo:
#ssh -i MyTest-ec2.pem ec2-user@3.xx.xx.124
#mongo --port 27017 -u "aws-MyTest-mongo1" --authenticationDatabase "MyTest" -p "aws-MyTest-mongo" --host 10.xx.xx.86


#Stacks
aws cloudformation describe-stacks --region us-east-1 --profile mfa \
  --stack-name MyTest-ecs-cluster
aws cloudformation describe-stack-events --region us-east-1 --profile mfa \
  --stack-name MyTest-ecs-cluster
aws cloudformation describe-stacks \
  --region us-east-1 \
  --profile mfa \
  --stack-name MyTest-ecs-def

###Delete Stack
aws cloudformation delete-stack  --region us-east-1   --profile mfa \
  --stack-name <stack-name>


##EC2
aws ec2 describe-instances --filters "Name=tag:Project,Values=MyTest"  \
  --region us-east-1   --profile mfa

aws ec2 describe-instances --filters "Name=tag:Project,Values=MyTest"    --region us-east-1   --profile mfa > log
cat log | grep PublicIpAddress


##ECS
aws ecs list-clusters --region us-east-1   --profile mfa
aws ecs describe-clusters --cluster MyTest-Containers  --region us-east-1   --profile mfa
