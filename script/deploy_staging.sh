#!/bin/sh
set -ex

# ciからec2にアクセスする際のIPアドレス（毎回異なる）
IP=`curl -f -s ifconfig.me`

# ec2のci用のセキュリティグループにawscliで、このIPアドレスのインバウンドを許可するよう設定する
aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 22 --cidr ${IP}/32
# Capistranoの実行コマンド（メインec2のみ）
ROLES=web1 bundle exec cap production deploy
# ec2のci用のセキュリティグループにawscliで、このIPアドレスのインバウンド許可設定を削除する
aws ec2 revoke-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 22 --cidr ${IP}/32
