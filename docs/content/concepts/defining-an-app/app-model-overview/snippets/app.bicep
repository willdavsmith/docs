import radius as radius

param storageId string
param location string = resourceGroup().location
param environment string

resource app 'Applications.Core/applications@2022-03-15-privatepreview' = {
  name: 'shopping-app'
  location: location
  properties: {
    environment: environment
  }
}

//CONTAINER
resource store 'Applications.Core/containers@2022-03-15-privatepreview' = {
  name: 'storefront'
  location: location
  properties: {
    application: app.id
    container: {
      image: 'radius.azurecr.io/storefront'
      env: {
        ENVIRONMENT: 'production'
        INV_STATESTORE: inventory.name
      }
      ports: {
        http: {
          containerPort: 80
        }
      }
    }
    connections: {
      inventory: {
        source: inventory.id
      }
    }
  }
}
//CONTAINER
//STATESTORE
resource inventory 'Applications.Connector/daprStateStores@2022-03-15-privatepreview' = {
  name: 'inventorystore'
  location: location
  properties: {
    environment: environment
    application: app.id
    kind: 'state.azure.tablestorage'
    resource: storageId
  }
}
//STATESTORE