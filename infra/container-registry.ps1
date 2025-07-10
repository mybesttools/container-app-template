$rgname = "rg-flask"
$location = "westus2"
$acrname = "mybesttoolstestacr01"

az login

az group create --name $rgname --location $location

az acr create --resource-group $rgname --name $acrname --sku Basic

az acr login --name $acrname



