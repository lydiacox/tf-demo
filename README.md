# tf-demo
This is a demonstration of how Terraform can be used to build, manage and destroy resources.

## Run Terraform
Create resources with Terraform:
```
terraform init
terraform plan
terraform apply
```
To remove all resources created by Terraform:
```
terraform destroy
```

## Outputs
| Name | Description |
| ---- | ----------- |
| network_id | Network ID |
| network_self_link | Network self link. |
| subnetwork_id | Subnetwork ID. |
| subnetwork_self_link | Subnetwork self link. |
| compute_instance_ids | List of compute instance IDs. |
| compute_instance_self_links | List of compute instance self links. |
