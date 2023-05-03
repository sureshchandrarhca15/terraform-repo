#!/bin/bash

# This script is a shell wrapper on top of terraform and will be executed based upon enviornment and org you are going to pass as parameters and env specific variables.tfvars file from environment folder
# For example:
# ./provisioner --org <organization> --provider <provider> --environment <environment>

SCRIPT=$( basename "$0" )

######################################
## Function to exit from the script ##
######################################

function _die()
{
    local message=$1
    [ -z "$message" ] && message="Died"
    echo "$message at $BASH_SOURCE[1]:$FUNCNAME[1] line $BASH_LINENO[0]" >&2
    exit 1
}

######################################
## Function to show help            ##
######################################

function _usage()
{

cat <<EOF

This script help you to create/manage Environment infrastructure based on Organization, Cloud Provider (aws, azure & gcp) and Environments (dev, stage & prod).

  Usage: $SCRIPT --org <Organization> --provider <provider> --environment <environment>

  Options:
    -h <Help>            :  Print out a usage message.
    --org                :  Provide the Organization Name such as OrgA|OrgB .
    --provider           :  Provide the Cloud Provider name such as aws|azure|gcp .
    --environment        :  Provide the Environment Name such as dev|stage|prod .
EOF

}

###########################################
## Function to Deploy Kubernetes Cluster ##
###########################################

function _deploy()
{

## Change working directory ##

echo "Working Directory is : provider/${provider}/gke-private-cluster"

cd provider/${provider}/gke-private-cluster/
/usr/local/bin/terraform init

echo "Terraform Plan is    : /usr/local/bin/terraform plan -var-file=../../../environments/${provider}/${org}/${environment}/gke-private-cluster-variables.tfvars"

/usr/local/bin/terraform plan -var-file=../../../environments/${provider}/${org}/${environment}/gke-private-cluster-variables.tfvars

#echo "Terraform Apply is   : /usr/local/bin/terraform apply -var-file=../../../environments/${provider}/${org}/${environment}/gke-private-cluster-variables.tfvars"

/usr/local/bin/terraform apply -var-file=../../../environments/${provider}/${org}/${environment}/gke-private-cluster-variables.tfvars




}

############################################
## Function to Destroy Kubernetes Cluster ##
############################################

function _destroy()
{

## Change working directory ##

echo "Working Directory is : provider/${provider}/gke-private-cluster"

cd provider/${provider}/gke-private-cluster/

## To destroy GKE Cluster ##
/usr/local/bin/terraform destroy -var-file=../../../environments/${provider}/${org}/${environment}/gke-private-cluster-variables.tfvars

}


while [[ $# -gt 0 ]]
do
    key="$1"

    case $key in
        --org)
        org="$2"
        shift # past argument
        shift # past value
        ;;
        --provider)
        provider="$2"
        shift # past argument
        shift # past value
        ;;
        --environment)
        environment="$2"
        shift # past argument
        shift # past value
        ;;
        *)    # unknown option
        echo "Unknown option: $1"
        exit 1
        ;;
    esac
done

# Check if required arguments are provided
if [ -z "${org}" ] || [ -z "${provider}" ] || [ -z "${environment}" ]; then
    echo "Missing required argument(s)."
    _usage
    exit 1
fi

_deploy
#_destroy
