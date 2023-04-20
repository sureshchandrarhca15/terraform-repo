# This script is a shell wrapper on top of terraform and will be executed based upon enviornment and org you are going to pass as parameters and env specific variables.tfvars file from environment folder
# For example:
# ./provisioner --org <organization> --provider <provider> --environment <environment>


## To deploy GKE Cluster ## 
cd provider/gcp/gke/ && /usr/local/bin/terraform init && /usr/local/bin/terraform plan -var-file=../../../environments/gcp/org-e/dev/variables.tfvars && /usr/local/bin/terraform apply -var-file=../../../environments/gcp/org-e/dev/variables.tfvars

## To destroy GKE Cluster ## 
#cd provider/gcp/gke/ && /usr/local/bin/terraform destroy -var-file=../../../environments/gcp/org-e/dev/variables.tfvars
