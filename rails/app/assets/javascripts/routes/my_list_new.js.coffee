App.MyListsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('myList')

  afterModel: (model, transition)->
     @transitionTo('my_list', model)
