# Best Practicies to Provisiong SageMaker Studio

1. Please click the button below to create a Service Catalog Product and Product Portfolio which can provision Studio and its associated roles:

[![Launch in us-west-2](https://raw.githubusercontent.com/awslabs/aws-media-insights-engine/development/docs/assets/images/launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=sagemaker-studio&templateURL=https://studio-provisioning-aggarzo.s3-us-west-2.amazonaws.com/studio_product.template)

2. Go to **AWS Console / Service Catalog / Products**. Launch the **SageMaker Studio** product.

3. Provide VPC and Subnet IDs used for SageMaker communication

4. Create a SageMaker IAM admin user and attach the **CreateSageMakerStudioUserPolicy**

5. Create IAM user for each Studio users. Attach the following policies to them: 
    - **SageMakerDeveloperPolicy**
    - **SageMakerReadOnlyAccessPolicy**
    - **SageMakerAccessSupportingServicesPolicy**
 If needed, you can customize these policies.
 
6. 
   
