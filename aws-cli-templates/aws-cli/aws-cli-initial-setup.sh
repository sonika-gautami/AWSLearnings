#Create SSH KeyPair
export awsProfile=myaccount
export awsProfile=mfa

#Create ssh key-pair
#Below command will create key-pair & stores the private-key in MyTestEc2.pem file
#To connect ec2 - follow -> files/connect-to-ec2.sh
aws ec2 create-key-pair \
  --region us-east-1 \
  --profile $awsProfile \
  --key-name key \
  --query 'KeyMaterial' \
  --output text > key.pem

#Upload s3 docs
aws s3 cp \
  cf/ \
  s3://mybucket/cf/ \
  --recursive \
  --exclude "*" --include "*.yaml" \
  --profile $awsProfile

aws s3 cp \
  cf/ \
  s3://test-sonika-1/cf/ \
  --recursive \
  --exclude "*" --include "*.yaml" \
  --profile $awsProfile

#Create-Secret
#Output will have ARN of secret.
aws secretsmanager create-secret \
  --region us-east-1 \
  --profile $awsProfile \
  --tags Key=Project,Value=MyTest \
  --name DockerCred \
  --description "Credentials to pull images from Private Artifactory" \
  --secret-string file://docker-private-repo-cred.json

#MyTest-Infra
aws cloudformation create-stack \
  --region us-east-1 \
  --profile $awsProfile \
  --tags Key=Project,Value=MyTest \
  --stack-name infra \
  --template-url https://test-sonika-1.s3.amazonaws.com/cf/infra.yaml \
  --parameters \
  ParameterKey=TagKey,ParameterValue=Project \
  ParameterKey=TagValue,ParameterValue=MyTest \
  ParameterKey=PreferredZone,ParameterValue=us-east-1c \
  ParameterKey=IPToAllowSshFrom,ParameterValue=60.254.47.225
