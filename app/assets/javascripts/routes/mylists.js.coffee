App.MyListsRoute = Ember.Route.extend
  #model is a hook, the result of which is then available to the controller, view, template
  model: -> @store.find 'myList'

  setupController: (controller, model)->
    @_super(controller, model)
    #controller.set 'mylists', @store.find 'myList'
    controller.set 'items',  @store.find 'item'