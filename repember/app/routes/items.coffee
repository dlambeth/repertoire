`import Ember from 'ember'`

ItemsRoute = Ember.Route.extend
  model: (params) -> @store.find 'item'

`export default ItemsRoute`