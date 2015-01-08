`import Ember from 'ember'`

ItemController = Ember.ObjectController.extend
  
  actions:
    saveItem: -> 
      alert 'here we go!'
      @get('model').save()

`export default ItemController`