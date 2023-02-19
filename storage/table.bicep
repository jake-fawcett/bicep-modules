@description('This is the Storage Account name')
param storageAccountName string

@description('This is the Storage Account Table name')
param tableName string

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' existing = {
  name: storageAccountName
}

resource storageAccountTableService 'Microsoft.Storage/storageAccounts/tableServices@2022-05-01' existing = {
  name: 'default'
  parent: storageAccount
}

resource usersTable 'Microsoft.Storage/storageAccounts/tableServices/tables@2022-05-01' = {
  name: tableName
  parent: storageAccountTableService
  properties: {}
}
