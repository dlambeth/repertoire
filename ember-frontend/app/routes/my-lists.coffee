`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

MyListsRoute = Ember.Route.extend(AuthenticatedRouteMixin, {
  #model is a hook, the result of which is then available to the controller, view, template
  model: -> @store.find 'myList'

  setupController: (controller, model)->
    @_super(controller, model)
    controller.set 'songLibrary', @store.find 'item'
})
`export default MyListsRoute`