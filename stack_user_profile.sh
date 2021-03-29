#!/bin/bash
#aws --region us-east-1 cloudformation update-stack \
#    --stack-name studio \
#    --template-body file://studio.yaml \
#    --parameters 'ParameterKey=DomainName,ParameterValue=my-sm-domain2' 'ParameterKey=VpcId,ParameterValue=vpc-493a0433' 'ParameterKey=Subnets,ParameterValue="subnet-14f21072"' \
#    --capabilities CAPABILITY_NAMED_IAM
#     --parameters 'ParameterKey=DomainName,ParameterValue=my-sm-domain2' 'ParameterKey=VpcId,ParameterValue=vpc-493a0433' 'ParameterKey=Subnets,ParameterValue="subnet-14f21072,subnet-e06f80bf,subnet-863c8ecb"' \

aws --region us-east-2 cloudformation create-stack \
    --stack-name studio-profile \
    --template-body file://product_user_profile.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters 'ParameterKey=DomainId,ParameterValue=d-k0chuieakbwk' 'ParameterKey=UserProfileName,ParameterValue=user1' 
