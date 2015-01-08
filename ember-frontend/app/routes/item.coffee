`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

ItemRoute = Ember.Route.extend
  model: (params) -> @store.find 'item', params.id

`export default ItemRoute`
`export default Ember.Route.extend(AuthenticatedRouteMixin)`