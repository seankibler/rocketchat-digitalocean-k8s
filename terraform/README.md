# DigitalOcean Kubernetes Cluster

## Requirements

* terraform
* DigitalOcean account (with k8s enabled)
* DigitalOcean API token

## Usage

Initialize terraform

```shell
terraform init
```

Configure DigitalOcean token input var

```shell
cp terraform.tfvars.example terraform.tfvars
sed -i -e 's/TOKEN/YOUR_DIGITAL_OCEAN_API_TOKEN/' terraform.tfvars
```

Generate and review plan

```shell
terraform plan -out latest.tfplan
```

Apply plan
```shell
terraform apply latest.tfplan
```
