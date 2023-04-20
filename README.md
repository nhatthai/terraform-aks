# Create Infrastructure AKS using Terraform
GitOps:
    + Create infrastructure Azure Kubernetes Service using Terraform and
    + Push terraform state file to Azure Storage.
    + Using GitHub Actions

### Requisite
    + Install azure cli

### Using Terraform in Azure
+ Azure Login
    ```
    az login
    ```

+ Create group in Azure
    ```
    az ad sp create-for-rbac --name "myAKS" --role contributor --scopes /subscriptions/<SUBSCRIPTION_ID>
    ```
    Copy and paste appId and password into GitHub secert with AZURE_AD_CLIENT_ID, AZURE_AD_CLIENT_SECRET and AZURE_AD_TENANT_ID respectively

+ Create Azure Credentials
    ```
    az ad sp create-for-rbac --name "myAKS" --role contributor --scopes /subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP> --sdk-auth
    ```
    Copy and paste into secret AZURE_CREDENTIAL in the github repository

+ Make sure that you created storage accounts in Azure

+ Set Role for storage accounts
    ```
    .\role.ps1
    ```

+ Add secret values into GitHub
    ```
    AZURE_AD_CLIENT_ID
    AZURE_AD_CLIENT_SECRET
    AZURE_SUBSCRIPTION_ID
    AZURE_AD_TENANT_ID
    AKS_SERVICE_PRINCIPAL_APP_ID
    AKS_SERVICE_PRINCIPAL_CLIENT_SECRET
    ```

+ Get Credentials for kubectl
    ```
    az aks get-credentials -n <AKS_NAME> -g <RESOURCE_GROUP>
    ```