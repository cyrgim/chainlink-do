# # Hosting a Chainlink node on Digital Ocean

Deployment of a chainlink node on a kubernetes cluster / hosted DB on Digital ocean.

# Pre requisites

## Terraform > 0.14 installed
```
➜  ~ terraform version
Terraform v0.14.5
```
## Environment variables
```
TF_VAR_do_token=xxx                // Digital Ocean PAT Token
TF_VAR_eth_url=xxx                 // Ethereum URL
TF_VAR_api_email=xxx               // Email used to set up chainlink node UI
TF_VAR_oracle_contract_address=xxx // Oracle address if defined
```
# Installation
```
➜  chainlink_install terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/random...
- Finding latest version of hashicorp/kubernetes...
- Finding digitalocean/digitalocean versions matching "1.22.2"...
- Finding cyrilgdn/postgresql versions matching "1.11.1"...
- Finding latest version of hashicorp/helm...
- Installing cyrilgdn/postgresql v1.11.1...
- Installed cyrilgdn/postgresql v1.11.1 (self-signed, key ID 3918DD444A3876A6)
- Installing hashicorp/helm v2.0.2...
- Installed hashicorp/helm v2.0.2 (signed by HashiCorp)
- Installing hashicorp/random v3.0.1...
- Installed hashicorp/random v3.0.1 (signed by HashiCorp)
- Installing hashicorp/kubernetes v2.0.2...
- Installed hashicorp/kubernetes v2.0.2 (signed by HashiCorp)
- Installing digitalocean/digitalocean v1.22.2...
- Installed digitalocean/digitalocean v1.22.2 (signed by a HashiCorp partner, key ID F82037E524B9C0E8)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

```
➜  chainlink_install terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # digitalocean_database_cluster.postgres_cluster will be created
  + resource "digitalocean_database_cluster" "postgres_cluster" {
      + database             = (known after apply)
 .....
 Apply complete! Resources: 9 added, 0 changed, 0 destroyed.

Outputs:

api_email = "xxx@gmail.com"
api_password = "xxx"
database_url = "postgresql://chainlink:xxx@yyy:25060/chainlink"
node_password = "xxx"
 ```

# Security

Database can be configured to add the kubernetes cluster tag as a trusted source and restrict DB access to this cluster.