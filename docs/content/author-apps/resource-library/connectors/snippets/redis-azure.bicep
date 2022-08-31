import radius as radius

param location string = resourceGroup().location
param environment string

//RESOURCE
resource azureRedis 'Microsoft.Cache/Redis@2019-07-01' = {
  name: 'myredis'
  location: location
  properties: {
    sku: {
      capacity: 0
      family: 'C'
      name: 'Basic'
    }
  }
}
//RESOURCE

resource app 'Applications.Core/applications@2022-03-15-privatepreview' existing = {
  name: 'myapp'
}

//CONNECTOR
resource redis 'Applications.Connector/redisCaches@2022-03-15-privatepreview' = {
  name: 'myredis-connector'
  location: 'global'
  properties: {
    environment: environment
    application: app.id
    resource: azureRedis.id
  }
}
//CONNECTOR
//CONTAINER
resource container 'Applications.Core/containers@2022-03-15-privatepreview' = {
  name: 'mycontainer'
  location: 'global'
  properties: {
    application: app.id
    container: {
      image: 'myrepo/myimage'
    }
    connections: {
      inventory: {
        source: redis.id
      }
    }
  }
}
//CONTAINER
