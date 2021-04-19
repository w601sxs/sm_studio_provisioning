#!/bin/bash
BUCKET_NAME=studio-provisioning-templates-aggarzo
aws s3 cp launch_template.yaml s3://$BUCKET_NAME/launch.template
aws s3 cp product_studio_domain.yaml s3://$BUCKET_NAME/product_studio_domain.template
aws s3 cp product_user_profile.yaml s3://$BUCKET_NAME/product_user_profile.template
