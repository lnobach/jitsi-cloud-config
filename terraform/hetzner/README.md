# Jitsi Meet Terraform Mini-Infrastructure for Hetzner

The mini infrastructure will consist of a single VM and two elastic IPs (IPv4 and IPv6 subnet).

## How to bring up and update

```
export TF_VAR_hcloud_token="<insert your Hetzner token>"
export TF_VAR_remote_watermark_image="https://my.domain/images/my-logo.svg"
export TF_VAR_frontend_domain="meet.my.domain"
export TF_VAR_letsencrypt_mail="mail@my.domain"
export TF_VAR_ssh_key="ssh-rsa quuxquuux..."

terraform init
terraform apply
```

The Terraform script will output your IPv4/6 addresses. Create a DNS A and AAAA record with your frontend domain pointing to your IPv4 and IPv6 addresses.

## How to destroy

Please beware that the destoy command also brings down your elastic IPs. If you want to bring them up again they might be different than before, so you may have to also set new DNS records.

```
terraform destroy
```
