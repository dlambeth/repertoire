App.MyListsController = Ember.ArrayController.extend
  fields: {}

  #properties for adding a new song, right now not attaching it to the list. 
  itemFields: {}
  
  disabled: (->
      Ember.isEmpty(@get('fields.title'))
  ).property('fields.title')
    
  addItemDisabled: (->
      Ember.isEmpty(@get('itemFields.title'))
  ).property('itemFields.title')
    
  actions: 
      createList: ->
          newList = @store.createRecord 'my_list', @get('fields')
          newList.save().then =>
              @set 'fields', {}

      #todo: I think this should really be in the item controller, etc. 
      createItem: ->
          newItem = @store.createRecord 'item', @get('itemFields')
          newItem.save().then =>
              @set 'itemFields', {}

