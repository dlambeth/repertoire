App.ItemsIndexRoute = Ember.Route.extend
  #model is a hook, the result of which is then available to the controller, view, template
  model: -> 
    songs = [ {title: "From the Index Route"},
      {title: "I'll see you in my dreams"},
      {title: "The Way You Look Tonight"},
      {title: "The Way You Look Tonight"},
      {title: "The Way You Look Tonight"},
    ]