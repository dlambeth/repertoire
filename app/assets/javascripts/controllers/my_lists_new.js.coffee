App.MyListsNewController = Ember.ObjectController.extend(
  
  actions:
    saveChanges: -> 
      myList = @get('model')
      #myList = @store.createRecord 'myList', list.get('title')
      myList.save().then =>
        @transitionToRoute 'my_list', myList
      return
)