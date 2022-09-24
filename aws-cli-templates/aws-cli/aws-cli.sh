#DocumentDB
aws cloudformation create-stack \
  --region us-east-1 \
  --profile mfa \
  --tags Key=Project,Value=MyTest \
  --stack-name MyTest-document-db \
  --template-url https://MyTest-MyTest-test.s3.ap-south-1.amazonaws.com/cf/document-db.yaml \
  --parameters \
ParameterKey=DocumentDbSg,ParameterValue=sg-0dff8b4edc21f20a9 \
ParameterKey=SubnetsForDocumentDB,ParameterValue=subnet-02b329900a170db6e\\,subnet-0b8b8d60160745aa3 \
ParameterKey=AzForDocumentDB,ParameterValue=us-east-1a\\,us-east-1c

#Mongo-shell, free5gc+localhost-mongo, dummy-nrf
#aws cloudformation update-stack \
aws cloudformation create-stack \
  --region us-east-1 \
  --profile mfa \
  --tags Key=Project,Value=MyTest \
  --stack-name MyTest-mongo \
  --template-url https://MyTest-MyTest-test.s3.ap-south-1.amazonaws.com/cf/mongo-ec2.yaml \
  --parameters \
ParameterKey=TagKey,ParameterValue=Project \
ParameterKey=TagValue,ParameterValue=MyTest \
ParameterKey=AMIImageId,ParameterValue=ami-038f1ca1bd58a5790 \
ParameterKey=SSHKeyPairName,ParameterValue=MyTest-ec2 \
ParameterKey=SecurityGroupId,ParameterValue=sg-0dff8b4edc21f20a9 \
ParameterKey=SubnetId,ParameterValue=subnet-0d8679921dd20b325 \
ParameterKey=VPCId,ParameterValue=vpc-016afbe8915080253

#aws analytics ec2
aws cloudformation create-stack \
  --region us-east-1 \
  --profile mfa \
  --tags Key=Project,Value=MyTest \
  --stack-name MyTest-analytics \
  --template-url https://MyTest-MyTest-test.s3.ap-south-1.amazonaws.com/cf/ana-ec2.yaml \
  --parameters \
ParameterKey=TagKey,ParameterValue=Project \
ParameterKey=TagValue,ParameterValue=MyTest \
ParameterKey=AMIImageId,ParameterValue=ami-038f1ca1bd58a5790 \
ParameterKey=SSHKeyPairName,ParameterValue=MyTest-ec2 \
ParameterKey=SecurityGroupId,ParameterValue=sg-0dff8b4edc21f20a9 \
ParameterKey=SubnetId,ParameterValue=subnet-0d8679921dd20b325 \
ParameterKey=VPCId,ParameterValue=vpc-016afbe8915080253


#ParameterKey=DocumentDBPermFile,ParameterValue=wget\\ https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem \
#ParameterKey=DocumentDBCmd,ParameterValue=mongo\\ --ssl\\ --host\\ MyTest-document-db-guavus.cluster-cks5sfsjsmfj.us-east-1.docdb.amazonaws.com:27017\\ --sslCAFile\\ rds-combined-ca-bundle.pem\\ --username\\ MyTest\\ --password\\ MyTest12#


#Kinesis
#NoOfShards=1 don't change this value
aws cloudformation create-stack \
  --region us-east-1 \
  --profile mfa \
  --tags Key=Project,Value=MyTest \
  --stack-name MyTest-kinesis \
  --template-url https://MyTest.s3.ap-south-1.amazonaws.com/cf/kinesis.yaml \
  --parameters \
ParameterKey=TagKey,ParameterValue=Project \
ParameterKey=TagValue,ParameterValue=MyTest \
ParameterKey=NoOfHoursTTL,ParameterValue=24 \
ParameterKey=NoOfShards,ParameterValue=1

#ECS-Task-Cluster
#NoOfInstances this can be min of 2 & max needed is 3. more than 3 will result in un-used resources
aws cloudformation create-stack \
  --region us-east-1 \
  --profile mfa \
  --tags Key=Project,Value=MyTest \
  --stack-name MyTest-ecs-cluster \
  --template-url https://MyTest.s3.ap-south-1.amazonaws.com/cf/ecs-cluster.yaml \
  --parameters \
ParameterKey=TagKey,ParameterValue=Project \
ParameterKey=TagValue,ParameterValue=MyTest \
ParameterKey=AMIImageId,ParameterValue=ami-09a3cad575b7eabaa \
ParameterKey=SSHKeyPairName,ParameterValue=MyTest-ec2 \
ParameterKey=SecurityGroupId,ParameterValue=sg-0dff8b4edc21f20a9 \
ParameterKey=SubnetId,ParameterValue=subnet-0d8679921dd20b325 \
ParameterKey=VPCId,ParameterValue=vpc-016afbe8915080253 \
ParameterKey=IamRoleForEC2,ParameterValue=arn:aws:iam::<account>:instance-profile/Role-ECS \
ParameterKey=NoOfInstances,ParameterValue=3

#ECS-Task-Def - MyTest-Server
#change mongo-host, mongo-additional-props, image-version
aws cloudformation update-stack \
  --region us-east-1 \
  --profile mfa \
  --tags Key=Project,Value=MyTest \
  --stack-name MyTest-server-ecs-def \
  --template-url https://MyTest-MyTest-test.s3.ap-south-1.amazonaws.com/cf/ecs-task-definations-server-only.yaml \
  --parameters \
ParameterKey=TagKey,ParameterValue=Project \
ParameterKey=TagValue,ParameterValue=MyTest \
ParameterKey=DockerCredentialsSMArn,ParameterValue=arn:aws:secretsmanager:us-east-1:account:secret:docker-private-artifactory-3CUhjc \
ParameterKey=ExecutionRoleARN,ParameterValue=arn:aws:iam::account:role/ecs-task-role \
ParameterKey=TaskRoleARN,ParameterValue=arn:aws:iam::account:role/ecs-task-role \
ParameterKey=MongoHost,ParameterValue=MyTest-document-db-guavus.cluster-cks5sfsjsmfj.us-east-1.docdb.amazonaws.com \
ParameterKey=MongoAdditionalProps,ParameterValue=ssl=true\&replicaSet=rs0\&readPreference=secondaryPreferred\&retryWrites=false \
ParameterKey=KinesisShardId,ParameterValue=shardId-000000000000 \
ParameterKey=MyTestServerImage,ParameterValue=sonikasg/mytestings:aws-MyTest-server-v3.2.0

#ECS-Tasks - MyTest-Server
aws cloudformation create-stack \
  --region us-east-1 \
  --profile mfa \
  --tags Key=Project,Value=MyTest \
  --stack-name MyTest-server-ecs-tasks \
  --template-url https://MyTest-MyTest-test.s3.ap-south-1.amazonaws.com/cf/ecs-tasks-server-only.yaml \
  --parameters \
ParameterKey=TagKey,ParameterValue=Project \
ParameterKey=TagValue,ParameterValue=MyTest \
ParameterKey=ECSClusterStackName,ParameterValue=MyTest-ecs-cluster \
ParameterKey=ECSTaskDefinitionsStackName,ParameterValue=MyTest-server-ecs-def


#ECS-Task-Def
#change mongo-host, image-version, MyTest-uuid, MyTest-ip-port, nrf-server-uri, dummy-nrf-uri as Nrf
aws cloudformation create-stack \
  --region us-east-1 \
  --profile mfa \
  --tags Key=Project,Value=MyTest \
  --stack-name MyTest-ecs-def \
  --template-url https://MyTest-test.s3.ap-south-1.amazonaws.com/cf/ecs-task-definations.yaml \
  --parameters \
ParameterKey=TagKey,ParameterValue=Project \
ParameterKey=TagValue,ParameterValue=MyTest \
ParameterKey=DockerCredentialsSMArn,ParameterValue=arn:aws:secretsmanager:us-east-1:account:secret:docker-private-artifactory-3CUhjc \
ParameterKey=ExecutionRoleARN,ParameterValue=arn:aws:iam::account:role/ecs-task-role \
ParameterKey=TaskRoleARN,ParameterValue=arn:aws:iam::account:role/ecs-task-role \
ParameterKey=NrfServerUriAsEnv,ParameterValue=https://10.xx.xx.193:8000 \
ParameterKey=MongoHost,ParameterValue=MyTest-document-db-guavus.cluster-cks5sfsjsmfj.us-east-1.docdb.amazonaws.com \
ParameterKey=MongoAdditionalProps,ParameterValue=ssl=true\&replicaSet=rs0\&readPreference=secondaryPreferred\&retryWrites=false \
ParameterKey=KinesisShardId,ParameterValue=shardId-000000000000 \
ParameterKey=MyTestClientImage,ParameterValue=sonikasg/mytestings:aws-MyTest-client-v3.2.0 \
ParameterKey=MyTestNotificationSerImage,ParameterValue=sonikasg/mytestings:aws-MyTest-not-v3.2.0 \
ParameterKey=MyTestServerIpPort,ParameterValue=10.32.1.142:9090 \
ParameterKey=NrfServerUriAsEnvForUEMobility,ParameterValue=https://10.32.1.193:9090/dummy-nrf

#ECS-Tasks
aws cloudformation create-stack \
  --region us-east-1 \
  --profile mfa \
  --tags Key=Project,Value=MyTest \
  --stack-name MyTest-ecs-tasks \
  --template-url https://MyTest-test.s3.ap-south-1.amazonaws.com/cf/ecs-tasks.yaml \
  --parameters \
ParameterKey=TagKey,ParameterValue=Project \
ParameterKey=TagValue,ParameterValue=MyTest \
ParameterKey=ECSClusterStackName,ParameterValue=MyTest-ecs-cluster \
ParameterKey=ECSTaskDefinitionsStackName,ParameterValue=MyTest-ecs-def

