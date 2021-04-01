## Best practices for provisioning Amazon SageMaker Studio

This repository includes reference architecture and cloud formation templates for provisioning SageMaker Studio. We use Service Catalog to set up and provision users. Diagram below showcases two flows that are supported, Cloud Admin and Data Scientist flows.

![Alt Flow Diagram](images/flow_diagram.png?raw=true "Flow Diagram")

If you would like to learn more about how we go about provisioning, please review the sections below. If you would like get started with the setup, please click the button below to create a Service Catalog Product and Product Portfolio which can provision Studio and its associated roles: 

[![Launch in us-west-2](https://raw.githubusercontent.com/awslabs/aws-media-insights-engine/development/docs/assets/images/launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=sagemaker-studio&templateURL=https://studio-provisioning-aggarzo.s3-us-west-2.amazonaws.com/launch.template)

This setup covers two personas:

* *Cloud Admin* – This team is also responsible for building and maintaining the infrastructure for supporting ML services, such as provisioning notebooks for data scientists to use, creating secure buckets for storing data, managing costs for ML from various lines of business (LOBs), and more.

* *Data science COE:* Data scientists within an AI Center of Excellence (COE) or embedded within the LOBs are responsible for building, training, and deploying models. In regulated industries, data scientists need to adhere to the organization’s security boundaries, such as using encrypted buckets for data access, use of private networking for accessing APIs, committing code to source control, ensuring all their experiments and trials are properly logged, enforcing encryption of data in transit, and monitoring deployed models.


Below are the resources the template provisions:

1. Cloud Admin IAM Role
2. Provisioning IAM Role
3. Data Scientist IAM Role
4. Studio Execution IAM Role
5. VPC and Subnets
6. Three Service Catalog products 
- Create Domain
- Create User
- Attach Image 


Below are the steps you will go through [ Andras to Update]:

1. Click on the Launch button above. Note - by default the template will launch in US-WEST-2 and you can switch the region you would like.

2. Click next

3. Update the Launch Principal. This can be an IAM user, group or role which grants provisioning access to this product.
  - Don't forget to enable IAM roles creation capabilities before launching the stack

4. Go to **AWS Console / Service Catalog / Products**. Launch the **SageMaker Studio** product.

5. Provide VPC and Subnet IDs used for SageMaker communication

6. Create a SageMaker IAM admin user and attach the **CreateSageMakerStudioUserPolicy**

7. Create IAM user for each Studio users and attach the **CreatePresignedDomainUrlPolicy** to them.

8. As an admin user, create user profiles for each Studio user with the following command:

```bash
was sagemaker create-user-profile --domain-id [domain-id] --user-profile-name [user profile name] --tags Key=studiouserid,Value=[iam user] --user-settings ExecutionRole=arn:aws:iam::[account id]:role/SageMakerTeamExecutionRole
```

9. If you need to group your studio users into teams, create new SageMaker team execution roles and assign the team execution roles to the corresponding users.

