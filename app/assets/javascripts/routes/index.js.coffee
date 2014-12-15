App.IndexRoute = Ember.Route.extend
  setupController: (controller, model)->
    @_super(controller, model)
    controller.set 'mylists', @store.find 'myList'
    controller.set 'items',  @store.find 'item'

