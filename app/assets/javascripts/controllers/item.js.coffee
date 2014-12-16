App.ItemController = Ember.ObjectController.extend
  
  actions:
    saveChanges: -> @get('model').save()