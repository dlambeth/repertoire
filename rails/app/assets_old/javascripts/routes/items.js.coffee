App.ItemsRoute = Ember.Route.extend
  model: (params) -> @store.find 'item'
  #model is a hook, the result of which is then available to the controller, view, template
  