# ECS Deployment

This repository makes it easy to deploy code from local development environment to AWS ECS

## How to use this repository

- You need to clone this repositorty
- You should import your applications source codes to this repository
- You need to modify Dockerfile to make use of your netbeans builds
- You need to modify Docker-compose file
- You need to modify ecs-params.yml file with necessary vpc subnet values and resource needs
- All scripts on this repository should run on a bash like shell(git bash is preferred for windows environments)
- Export necessary variables: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, region, aws_account_id, ecr_repo
- You should run create-cluster.sh for only one time
- You should create an ecr repository
- You should create an aws cw log-group for ecs logs
- When you want to make deployments only run deploy-application.sh with command: ‘sh deploy-application.sh‘

### Pre-requisites

- You should install aws-cli
- You should install ecs-cli
- You should have IAM account with necessary roles or policies
- You should export that accounts AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY