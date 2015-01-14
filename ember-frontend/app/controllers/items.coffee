`import Ember from 'ember'`

ItemsController = Ember.ArrayController.extend
  fields: {}
  
  disabled: (->
      Ember.isEmpty(@get('fields.title'))
  ).property('fields.title')
    
  actions: 
      createNewItem: ->
        newItem = @store.createRecord 'item', @get('fields')
        newItem.save().then =>
          @set 'fields', {}

`export default ItemsController`