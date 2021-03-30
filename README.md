## Best Practicies to Provisiong SageMaker Studio

This repository includes reference architecture and cloud formation templates for provisioning SageMaker studio for Data Science teams. We use Service Catalog to provision SageMaker studio and Studio Users. 

If you would like to learn more about how we go about provisiong, please review the sections below. If you would like get started rightaway, please click the button below to create a Service Catalog Product and Product Portfolio which can provision Studio and its associated roles: [![Launch in us-west-2](https://raw.githubusercontent.com/awslabs/aws-media-insights-engine/development/docs/assets/images/launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=sagemaker-studio&templateURL=https://studio-provisioning-aggarzo.s3-us-west-2.amazonaws.com/launch.template)


Let's start by looking the key components within SageMaker Studio that we will need to consider while provisioning

* Domain - A primary component of Amazon SageMaker Studio is a domain The domain consists of a list of authorized users (called user profiles), and a variety of configurations such as Amazon Virtual Private Cloud (VPC) configurations and the default IAM execution role.
* User Profile- The user profile (user) is a configuration for the user that exists in the SageMaker domain. The user profile defines various configuration settings for the user and among other settings includes things such as the execution role, the default App specifications 
* Execution Role - The IAM execution role is the primary role that is assumed by the users and the service on behalf of the user to allow them perform certain actions and provision resources in SageMaker Studio
* JupyterServer App - This is the default app for a SageMaker Studio user. Each user will have one default JupyterServer app which will be created the first time the user logs in to SageMaker Studio
* KernelGateway App - A SageMaker image runs as a KernelGateway app. The app provides access to the kernels in the image. There is a one-to-one correspondence between a SageMaker image and a SageMaker app.

Data science user personas

The following table describes two different personas that interact with Amazon SageMaker Studio resources and the level of access they need to fulfill their duties. We use this table as a high-level requirement to model IAM roles and policies to establish desired controls based on resource ownership at the team and user level.

* *Cloud Admin* – This team is also responsible for building and maintaining the infrastructure for supporting ML services, such as provisioning notebooks for data scientists to use, creating secure buckets for storing data, managing costs for ML from various lines of business (LOBs), and more.
* *Data science COE:* Data scientists within an AI Center of Excellence (COE) or embedded within the LOBs are responsible for building, training, and deploying models. In regulated industries, data scientists need to adhere to the organization’s security boundaries, such as using encrypted buckets for data access, use of private networking for accessing APIs, committing code to source control, ensuring all their experiments and trials are properly logged, enforcing encryption of data in transit, and monitoring deployed models.

Reference Architecture (TODO)

![](./figures/StudioBlog.jpg)


Below are the steps that you will go through when you launch the cloudformation template:

1. Define the Launch Principal. This can be an IAM user, group or role which grants provisioning access to this product.
  - Don't forget to enable IAM roles creation capabilities before launching the stack

2. Go to **AWS Console / Service Catalog / Products**. Launch the **SageMaker Studio** product.

3. Provide VPC and Subnet IDs used for SageMaker communication

4. Create a SageMaker IAM admin user and attach the **CreateSageMakerStudioUserPolicy**

5. Create IAM user for each Studio users and attach the **CreatePresignedDomainUrlPolicy** to them.

6. As an admin user, create user profiles for each Studio user with the following command:

```bash
aws sagemaker create-user-profile --domain-id [domain-id] --user-profile-name [user profile name] --tags Key=studiouserid,Value=[iam user] --user-settings ExecutionRole=arn:aws:iam::[account id]:role/SageMakerTeamExecutionRole
```

7. If you need to group your studio users into teams, create new SageMaker team execution roles and assign the team execution roles to the corresponding users.

