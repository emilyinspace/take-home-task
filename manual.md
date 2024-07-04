# Help in order to use this repo

```shell
export AWS_ACCESS_KEY_ID=KEY
export AWS_SECRET_ACCESS_KEY=SECRET_KEY

# Get terraform provider files
make tf-init

# Apply terraform code
make tf-apply

# Afterwards, put EC2 public ip in inventory
pub_ip=$(terraform output public_ip | tr -d '"')
sed -i "s/EC2PUBLICIP/${pub_ip}/g" inventory

# install ansible dependencies
ansible-galaxy install -r requirements.yml
 
# Provision VM
ansible-playbook provision.yml

# Deploy docker application
ansible-playbook deployment.yml

# Check if everything works correctly
curl ${pub_ip}

# Cleanup created resources
make tf-des
```
