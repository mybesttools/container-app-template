$resourceGroupName = "rg-flask"
$acrName = "mybesttoolstestacr01"
$acrImage = "$acrName.azurecr.io/container-app-demo:v3"
$location = "westus2"
$containerAppEnv = "flask-python-env"
$containerAppName = "containerwebapp01"

# create container app environment
az containerapp env create --name $containerAppEnv --resource-group $resourceGroupName --location $location

# enable Admin user
az acr update -n $acrName --admin-enabled true

# fetch credentials
$acrUsername = az acr credential show --name $acrName --query "username" --output tsv
$acrPassword = az acr credential show --name $acrName --query "passwords[0].value" --output tsv

# create containerapp
az containerapp create `
    --name $containerAppName `
    --resource-group $resourceGroupName `
    --environment $containerAppEnv `
    --image $acrImage `
    --registry-server "$acrName.azurecr.io" `
    --registry-username $acrUsername `
    --registry-password $acrPassword `
    --target-port 80 `
    --ingress 'external' `
    --cpu 0.5 `
    --memory 1.0Gi

# update the app instance with another image version
az containerapp update `
    --name $containerAppName `
    --resource-group $resourceGroupName `
    --image $acrImage

