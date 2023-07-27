targetScope = 'subscription'

resource backuprg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'unixfy-backup-storage'
  location: 'westus2'
  tags: {
    managed: 'true'
  }
}
