App.MyListRoute = Ember.Route.extend
  #model is a hook, the result of which is then available to the controller, view, template
  model: (params) -> @store.find 'myList', params.id

  setupController: (controller, model)->
    @_super(controller, model)
    #controller.set 'songLibrary', @store.find 'item', does this need to be here
    #or could it be in the controller?
    #I think available songs should be a property on the controller and then 
    #we can modify it every time we use the controller. 
    controller.set 'songLibrary', @store.filter('item', (item) ->
      !(model.get('itemIdArray').contains(item.id))
    )