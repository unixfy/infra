param storageAccounts_unixfybackupwestus2_name string = 'unixfybackupwestus2'

resource storageAccounts_unixfybackupwestus2_name_resource 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccounts_unixfybackupwestus2_name
  location: 'westus2'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
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

resource storageAccounts_unixfybackupwestus2_name_default 'Microsoft.Storage/storageAccounts/blobServices@2022-09-01' = {
  parent: storageAccounts_unixfybackupwestus2_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
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

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_unixfybackupwestus2_name_default 'Microsoft.Storage/storageAccounts/fileServices@2022-09-01' = {
  parent: storageAccounts_unixfybackupwestus2_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
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

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_unixfybackupwestus2_name_default 'Microsoft.Storage/storageAccounts/queueServices@2022-09-01' = {
  parent: storageAccounts_unixfybackupwestus2_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_unixfybackupwestus2_name_default 'Microsoft.Storage/storageAccounts/tableServices@2022-09-01' = {
  parent: storageAccounts_unixfybackupwestus2_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource storageAccounts_unixfybackupwestus2_name_default_gambitprofit 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  parent: storageAccounts_unixfybackupwestus2_name_default
  name: 'gambitprofit'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [

    storageAccounts_unixfybackupwestus2_name_resource
  ]
}

resource storageAccounts_unixfybackupwestus2_name_default_thallium 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  parent: storageAccounts_unixfybackupwestus2_name_default
  name: 'thallium'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [

    storageAccounts_unixfybackupwestus2_name_resource
  ]
}
