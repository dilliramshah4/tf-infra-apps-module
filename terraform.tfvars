resource_group_name = "rg-dilliram-research"
subscription_id = "6deb691d-9d78-4e6c-a4e6-b618bcfa0196"  # The actual subscription ID value

location              = "East US"

storage_account_name  = "teststorageaccount99999"
registry_name         = "myacr9999"


key_vault_name = "demo-key-vault-99999"
key_vault_secrets = {
  "client-id"       = "example-client-id"
  "tenant-id"       = "example-tenant-id"
  "subscription-id" = "example-sub-id"
}

vnet_name         = "my-vnet"
vnet_address_space = ["10.0.0.0/16"]
vnet_subnets = {
  frontend = {
    address_prefixes = ["10.0.1.0/24"]
  }
  backend = {
    address_prefixes = ["10.0.2.0/24"]
  }
}

service_bus_namespace   = "my-sb-namespace989989"
service_bus_topic       = "my-topic"
service_bus_subscription = "my-subscription"
service_bus_sku         = "Standard"

tags = {
  environment = "dev"
  owner       = "dilliram"
}


project_name         = "myapp"
environment_name     = "myapp-env"
container_app_name   = "myapp"
container_app_env    = "myapp-env"

acr_id               = "/subscriptions/6deb691d-9d78-4e6c-a4e6-b618bcfa0196/resourceGroups/rg-dilliram-research/providers/Microsoft.ContainerRegistry/registries/dilli321"
acr_server           = "dilli321.azurecr.io"
frontend_image       = "frontend-app:v1"
backend_image        = "backend-app:v1"
target_port          = 3000




# Azure Container App Job Configuration
prefix      = "myjob"
image_name  = "frontend-app"
image_tag   = "v1"
# acr_server  = "dilli321.azurecr.io"
# acr_id      = "/subscriptions/6deb691d-9d78-4e6c-a4e6-b618bcfa0196/resourceGroups/rg-dilliram-research/providers/Microsoft.ContainerRegistry/registries/dilli321"