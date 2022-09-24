#
# aws configure
#AWS Access Key ID [None]: ...
#AWS Secret Access Key [None]: ...
#Default region name [None]: us-east-1
#Default output format [None]:
#
# cat ~/.aws/credentials

#
aws sts get-session-token \
  --serial-number arn:aws:iam::1234345:mfa/sonika.admin \
  --duration-seconds 129600 \
  --token-code 117658
#{
#    "Credentials": {
#        "AccessKeyId": "ASIAX6DLDWLAKBEXX",
#        "SecretAccessKey": "JuXVgZiT6eCYS6a2z4b0f27sW15fFmyx",
#        "SessionToken": "IQoJb3JpZ2luX2VjEOj//////////wEaCXVzLWVhc3QtMSJIMEQCT+tXE3ceXxHiVcJh0ECpovwedxvtRsZDJvgKslzeNhAIgafi4BtznNmhuvh6Ibz7pwklYXOSMpUmkspiyav5V7Ku8BCEEQAhoMNDgyMzc0NTM5NTAwIgzNatej+yApE8hqijQqzAFU1XcZne5N6sPirHf356FwL5KNPCIhHpO04ONG40gYI6FCrnze9y7bS0Nh5B8m7+uqU3oRcLP0dHgUhFIxn6UmR2cKI/LvQIoFl5T3ozV2G6VUz14EVYgnMBCKbEu0sslqSP0OY68NrZldU2mqFil7Hj3gieAb3fSWTfH38jRvL9GMR0gQO7zcRCAY4yx4qnbt0yIX5dxAAdjiy3jxctgK/GSD5u4HHSeZ3orQKOQhgUZLN1h6EvMvQqdBYlnN0TQILj+QMEwor61gwY6lwFasqJJafFwJ1XaXx8/sBPqyz4JBE1qN69/q8iO0I+/Xpgb9EahMkJB+FfiUpJ8RSEaIKyeEotkrj23C1rgKsxPQyNWJs2Fc6aVIWIts5QMBcmg1G2i/dGx5Fpfqb5NclBnCqIbK1bzMUACnIFDk47eB899F4Rrd1pkFFjNS++ibQTjZd7ij7ux/qShebrtFVwAOvdsWcNf",
#        "Expiration": "2021-04-08T19:28:34+00:00"
#    }
#}

#Use above credentails & edit credentials file with mfa profile
# cat ~/.aws/credentials
#[default]
#aws_access_key_id = ...
#aws_secret_access_key = ...
#
#[mfa]
#aws_access_key_id = ASIAX6DLDWLAKBEXX
#aws_secret_access_key = JuXVgZiT6eCYS6a2z4b0f27sW15fFmyx
#aws_session_token = IQoJb3JpZ2luX2VjEOj//////////wEaCXVzLWVhc3QtMSJIMEQCT+tXE3ceXxHiVcJh0ECpovwedxvtRsZDJvgKslzeNhAIgafi4BtznNmhuvh6Ibz7pwklYXOSMpUmkspiyav5V7Ku8BCEEQAhoMNDgyMzc0NTM5NTAwIgzNatej+yApE8hqijQqzAFU1XcZne5N6sPirHf356FwL5KNPCIhHe9y7bS0Nh5B8m7+uqU3oRcLP0dHgUhFIxn6UmR2cKI/LvQIoFl5T3ozV2G6VUz14EVYgnMBCKbEu0sslqSP0OY68NrZldU2mqFil7Hj3gieAb3fSWTfH38jRvL9GMR0gQO7zcRCAY4yx4qnbt0yIX5dxAAdjiy3jxctgK/GSD5u4HHSeZ3orQKOQhgUZLN1h6EvMvQqdBYlnN0TQILj+QMEwor61gwY6lwFasqJJafFwJ1XaXx8/sBPqyz4JBE1qN69/q8iO0I+/Xpgb9EahMkJB+FfiUpJ8RSEaIKyeEotkrj23C1rgKsxPQyNWJs2Fc6aVIWIts5QMBcmg1G2i/dGx5Fpfqb5NclBnCqIbK1bzMUACnIFDk47eB899F4Rrd1pkFFjNS++ibQTjZd7ij7ux/qShebrtFVwAOvdsWcNf

