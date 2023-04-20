## To deploy GKE Cluster ## 
cd provider/gcp/gke/ && /usr/local/bin/terraform init && /usr/local/bin/terraform plan -var-file=../../../environments/gcp/org-e/dev/variables.tfvars && /usr/local/bin/terraform apply -var-file=../../../environments/gcp/org-e/dev/variables.tfvars

## To destroy GKE Cluster ## 
#cd provider/gcp/gke/ && /usr/local/bin/terraform destroy -var-file=../../../environments/gcp/org-e/dev/variables.tfvars
