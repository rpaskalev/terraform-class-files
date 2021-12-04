terraform_version='0.13.0'
wget -q https://releases.hashicorp.com/terraform/$terraform_version/terraform_${terraform_version}_linux_amd64.zip
unzip terraform_${terraform_version}_linux_amd64.zip
install \
  -m 755 \
  terraform \
  /usr/local/bin
rm terraform terraform_${terraform_version}_linux_amd64.zip