#!/bin/bash
# curl https://get.acme.sh | sh
# export DP_Id=xxxx
# export DP_Key=xxxxxxxxxxxxxx

# $1: dns provider
function installCert() {
  read -p "Enter your domain: " domain
  read -p "Enter the path you wish to install: " path
  mkdir -p $path

  source /root/.acme.sh/acme.sh --issue --dns $1 -d $domain -d *.$domain
  source /root/.acme.sh/acme.sh --installcert -d $domain -d *.$domain   \
        --key-file $path/$domain.key \
        --fullchain-file $path/$domain.cer \
        --reloadcmd  "systemctl force-reload nginx"
}

PS3="Select your DNS provider: "
select provider in DNSPod Cloudflare Quit; do
  case $REPLY in
    1)
      read -p "Enter your DNSPod ID: " DP_Id
      read -p "Enter your DNSPod key: " DP_Key
      export DP_Id=$DP_Id
      export DP_Key=$DP_Key
      installCert "dns_dp"
      exit
      ;;
    2)
      read -p "Enter your cloudflare key: " CF_Key
      read -p "Enter your cloudflare email: " CF_Email
      export CF_Key=$CF_Key
      export CF_Email=$CF_Email
      installCert "dns_cf"
      exit
      ;;
    3)
      echo -e "\033[32mDone\033[0m"
      break
      ;;
    *)
      echo -e "\033[31mInvalid option $REPLY\033[0m"
      ;;
  esac
done