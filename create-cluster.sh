#!/usr/bin/env bash

# you should export AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, region, cluster_name

create_task_execution_role() {
  aws iam --region $region create-role --role-name ecsTaskExecutionRole --assume-role-policy-document ./task-execution-assume-role.json
  aws iam --region $region attach-role-policy --role-name ecsTaskExecutionRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy
}

configure_ecs_cli() {
  ecs-cli configure --cluster $cluster_name --default-launch-type FARGATE --config-name $cluster_name --region $region
  ecs-cli configure profile --access-key $AWS_ACCESS_KEY_ID --secret-key $AWS_SECRET_ACCESS_KEY --profile-name $cluster_name-profile
}

create_ecs_cluster() {
  ecs-cli up --cluster-config $cluster_name --ecs-profile $cluster_name-profile
}

create_task_execution_role
configure_ecs_cli
create_ecs_cluster