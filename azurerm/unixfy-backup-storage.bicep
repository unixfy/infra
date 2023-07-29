resource unixfybackupwestus2_storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'unixfybackupwestus2'
  location: 'westus2'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    routingPreference: {
      routingChoice: 'InternetRouting'
      publishMicrosoftEndpoints: false
      publishInternetEndpoints: false
    }
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
    allowSharedKeyAccess: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Cool'
  }
}

resource unixfybackupwestus2_storageAccount_blobServices 'Microsoft.Storage/storageAccounts/blobServices@2022-09-01' = {
  parent: unixfybackupwestus2_storageAccount
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: true
      enabled: true
      days: 7
    }
    isVersioningEnabled: false
    changeFeed: {
      enabled: false
    }
    restorePolicy: {
      enabled: false
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource unixfybackupwestus2_storageAccount_fileServices 'Microsoft.Storage/storageAccounts/fileServices@2022-09-01' = {
  parent: unixfybackupwestus2_storageAccount
  name: 'default'
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource unixfybackupwestus2_storageAccount_queueServices 'Microsoft.Storage/storageAccounts/queueServices@2022-09-01' = {
  parent: unixfybackupwestus2_storageAccount
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource unixfybackupwestus2_storageAccount_tableServices 'Microsoft.Storage/storageAccounts/tableServices@2022-09-01' = {
  parent: unixfybackupwestus2_storageAccount
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource unixfybackupwestus2_blob_gambitprofit 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  parent: unixfybackupwestus2_storageAccount_blobServices
  name: 'gambitprofit'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
}

resource unixfybackupwestus2_blob_cadmium 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  parent: unixfybackupwestus2_storageAccount_blobServices
  name: 'cadmium'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
}
