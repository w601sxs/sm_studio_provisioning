# Best Practicies to Provisiong SageMaker Studio

1. Please click the button below to create a Service Catalog Product and Product Portfolio which can provision Studio and its associated roles:

[![Launch in us-west-2](https://raw.githubusercontent.com/awslabs/aws-media-insights-engine/development/docs/assets/images/launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=sagemaker-studio&templateURL=https://studio-provisioning-aggarzo.s3-us-west-2.amazonaws.com/studio_product.template)

2. Go to **AWS Console / Service Catalog / Products**. Launch the **SageMaker Studio** product.

3. Provide VPC and Subnet IDs used for SageMaker communication

4. Create a SageMaker IAM admin user and attach the **CreateSageMakerStudioUserPolicy**

5. Create IAM user for each Studio users and attach the **CreatePresignedDomainUrlPolicy** to them.

6. As an admin user, create user profiles for each Studio user with the following command:

```bash
aws sagemaker create-user-profile --domain-id [domain-id] --user-profile-name [user profile name] --tags Key=studiouserid,Value=[iam user] --user-settings ExecutionRole=arn:aws:iam::[account id]:role/SageMakerTeamExecutionRole
```

7. If you need to group your studio users into teams, create new SageMaker team execution roles and assign the team execution roles to the corresponding users.

