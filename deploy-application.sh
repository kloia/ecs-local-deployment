#!/usr/bin/env bash

export region="eu-central-1"
export aws_account_id=""
export ecr_repo=""

docker_login() {
  aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $aws_account_id.dkr.ecr.$region.amazonaws.com
}

docker_build_tag_push() {
  timestamp=$(date +%s)
  docker build -t tomcat-application .
  docker tag tomcat-application $aws_account_id.dkr.ecr.$region.amazonaws.com/$ecr_repo:$timestamp
  docker push $aws_account_id.dkr.ecr.$region.amazonaws.com/$ecr_repo:$timestamp
  docker tag $aws_account_id.dkr.ecr.$region.amazonaws.com/$ecr_repo:$timestamp $aws_account_id.dkr.ecr.$region.amazonaws.com/$ecr_repo:latest
  docker push $aws_account_id.dkr.ecr.$region.amazonaws.com/$ecr_repo:latest
}

ecs_deploy() {
  ecs-cli compose --project-name $cluster_name service up --cluster-config $cluster_name --ecs-profile $cluster_name-profile --force-deployment
}

docker_login
docker_build_tag_push
ecs_deploy