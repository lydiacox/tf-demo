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
| bucket_ids | List of storage bucket IDs. |
| bucket_self_links | List of storage bucket self links. |
| compute_instance_ids | Compute instance ID. |
| compute_instance_self_links | Compute instance self link. |
| network_id | Network ID |
| network_self_link | Network self link. |
| subnetwork_id | Subnetwork ID. |
| subnetwork_self_link | Subnetwork self link. |
