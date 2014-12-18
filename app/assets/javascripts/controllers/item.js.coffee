App.ItemController = Ember.ObjectController.extend
  
  actions:
    saveItem: -> 
      alert 'here we go!'
      @get('model').save()