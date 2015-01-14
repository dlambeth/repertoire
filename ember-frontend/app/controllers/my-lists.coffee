`import Ember from 'ember'`

MyListsController = Ember.ArrayController.extend
  listController: 'MyListController'

  fields: {}
  
  disabled: (->
      Ember.isEmpty(@get('fields.title'))
  ).property('fields.title')
    
  actions: 
      createList: ->
        newList = @store.createRecord 'my_list', @get('fields')
        newList.save().then =>
          @set 'fields', {}

      deleteList:(list) ->
        #we want to delete the item from the db, and then also delete it from the collection.  
        #do I have to explicitly call delete? 
        list.destroyRecord()
         


`export default MyListsController`