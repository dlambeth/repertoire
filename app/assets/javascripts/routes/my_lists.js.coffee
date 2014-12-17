App.MyListsRoute = Ember.Route.extend
  #model is a hook, the result of which is then available to the controller, view, template
  model: -> @store.find 'myList'

  setupController: (controller, model)->
    @_super(controller, model)

    songs = [ {title: "From the Index Route"},
      {title: "I'll see you in my dreams"},
      {title: "The Way You Look Tonight"},
      {title: "The Way You Look Tonight"},
      {title: "The Way You Look Tonight"}
    ]

    controller.set 'songLibrary', songs
  #  @controllerFor('items').set('model', @store.find 'item')