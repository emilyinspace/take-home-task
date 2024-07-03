# take-home-task
a small exercise

## Explanation
```shell
export AWS_ACCESS_KEY_ID=KEY
export AWS_SECRET_ACCESS_KEY=SECRET_KEY

# Apply terraform code
make tf-apply

# Afterwards, put EC2 public ip in inventory
pub_ip=$(terraform output public_ip | tr -d '"')
sed -i "s/EC2PUBLICIP/${pub_ip}/g" inventory

# Provision VM
ansible-playbook provision.yml
```
### useful link about AWS networking https://stackoverflow.com/a/74455786
