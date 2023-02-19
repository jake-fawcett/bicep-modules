@description('This is the resource location')
param location string = resourceGroup().location

@description('This is the Web App Server name')
param webAppServerName string

@description('This is the Web App Server kind')
param webAppServerKind string

@description('This is the Web App Server sku')
param webAppServerSku string

resource webAppServer 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: webAppServerName
  location: location
  kind: webAppServerKind
  properties: {
    reserved: true
  }
  sku: {
    name: webAppServerSku
    tier: 'Basic'
    capacity: 1
  }
}
