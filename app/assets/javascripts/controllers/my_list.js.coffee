App.MyListController = Ember.ObjectController.extend
  itemFields: {}

  actions:
    saveChanges: -> @get('model').save()

    addItem: -> 
        newItem = @store.createRecord 'item', @get('itemFields')
        newItem.save().then =>
              @set 'itemFields', {}
    