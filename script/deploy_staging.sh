#!/bin/sh
set -ex

IP=`curl -f -s ifconfig.me`

aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 22 --cidr ${IP}/32
ROLES=web1 bundle exec cap production deploy
aws ec2 revoke-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 22 --cidr ${IP}/32
