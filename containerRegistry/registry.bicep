@description('Location of Resources.')
param location string = resourceGroup().location

@description('Name of your Azure Container Registry')
param acrName string

@description('Tier of your Azure Container Registry.')
param acrSku string = 'Basic'

resource acrResource 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  name: acrName
  location: location
  sku: {
    name: acrSku
  }
  properties: {
    adminUserEnabled: false
  }
}

@description('Output the login server property.')
output loginServer string = acrResource.properties.loginServer
