@description('This is the resource location')
param location string = resourceGroup().location

@description('This is the Storage Account name')
param storageAccountName string

@description('This is the Storage Account sku')
param storageAccountSku string = 'Standard_LRS'

@description('This is the Storage Account tier')
param storageAccountTier string = 'Hot'

@description('This is the Storage Account tier')
param storageAccountPublicAccess string = 'Disabled'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageAccountName
  location: location
  properties: {
    accessTier: storageAccountTier
    publicNetworkAccess: storageAccountPublicAccess
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
    networkAcls: {
      bypass: 'Logging, Metrics, AzureServices'
      defaultAction: 'Deny'
    }
  }
  sku: {
    name: storageAccountSku
  }
  kind: 'StorageV2'
}
