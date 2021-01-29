#!/bin/sh
set -ex

IP=`curl -f -s ifconfig.me`

aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 22 --cidr ${IP}/32
# ROLES=web1 bundle exec cap production deploy
aws ec2 revoke-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 22 --cidr ${IP}/32


# trap "aws ec2 revoke-security-group-ingress --group-id ${MYSECURITYGROUP} --protocol tcp --port 22 --cidr ${IP}/32" 0 1 2 3 15
# aws ec2 authorize-security-group-ingress --group-id ${MYSECURITYGROUP} --protocol tcp --port 22 --cidr ${IP}/32
# ROLES=web1 bundle exec cap production deploy


# export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
# export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
# export AWS_DEFAULT_REGION="ap-northeast-1"

# MYSECURITYGROUP="sg-0629db507f5c9b422"
# MYIP=`curl -s ifconfig.me`

# aws ec2 authorize-security-group-ingress --group-id ${MYSECURITYGROUP} --protocol tcp --port 22 --cidr ${IP}/32
# ROLES=web1 bundle exec cap production deploy
# aws ec2 revoke-security-group-ingress --group-id ${MYSECURITYGROUP} --protocol tcp --port 22 --cidr ${IP}/32