App.MyListsRoute = Ember.Route.extend
  #model is a hook, the result of which is then available to the controller, view, template
  model: -> @store.find 'myList'