App.MyListsController = Ember.ArrayController.extend
  fields: {}
  
  disabled: (->
      Ember.isEmpty(@get('fields.title'))
  ).property('fields.title')
    
  actions: 
      createList: ->
          newList = @store.createRecord 'my_list', @get('fields')
          newList.save().then =>
              @set 'fields', {}
