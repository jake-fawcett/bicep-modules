@description('This is the Storage Account name')
param storageAccountName string

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' existing = {
  name: storageAccountName
}

resource symbolicname 'Microsoft.Storage/storageAccounts/blobServices@2022-05-01' = {
  name: 'default'
  parent: storageAccount
  properties: {
    containerDeleteRetentionPolicy: {
      allowPermanentDelete: true
      days: 7
      enabled: true
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: true
      days: 7
      enabled: true
    }
    isVersioningEnabled: true
  }
}
