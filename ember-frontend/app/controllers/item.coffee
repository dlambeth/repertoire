`import Ember from 'ember'`

ItemController = Ember.ObjectController.extend
  isDisabled: true 

  actions:
    saveChanges: -> 
      #alert 'here we go!'
      title = @get('title')
      @get('model').save().then =>
        @.set 'isDisabled', true

    enableEdit:(item) ->
      @.set 'isDisabled', false

    deleteItem:() ->
      #before we destroy the model, look for any list items that use it:
      listItems = @get('model').get("listItems")
      #listItems.forEach (li) ->
      #  li.destroyRecord()

      @get('model').destroyRecord().then =>
        listItems.forEach (li) ->
          li.deleteRecord()  
        

`export default ItemController`