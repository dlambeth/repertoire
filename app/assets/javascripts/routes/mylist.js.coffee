App.MyListRoute = Ember.Route.extend
  #model is a hook, the result of which is then available to the controller, view, template
  model: (params) -> @store.find 'myList', params.id

  setupController: (controller, model)->
    @_super(controller, model)
    controller.set 'items',  @store.find 'item'