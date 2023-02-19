@description('This is the resource location')
param location string = resourceGroup().location

@description('This is the Web App Server name')
param webAppServerName string

@description('This is the Web App name')
param webAppName string

@description('This is the Web App Software version')
param webAppLinuxFxVersion string

resource webAppServer 'Microsoft.Web/serverfarms@2022-03-01' existing = {
  name: webAppServerName
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: webAppServer.id
    clientAffinityEnabled: false
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: webAppLinuxFxVersion
      minTlsVersion: '1.2'
      http20Enabled: true
      ftpsState: 'FtpsOnly'
      appSettings: [
        {
          name: 'SCM_DO_BUILD_DURING_DEPLOYMENT'
          value: 'True'
        }
      ]
    }
  }
  identity: {
    type: 'SystemAssigned'
  }
}
