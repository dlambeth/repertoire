`import Ember from 'ember'`

MyListsNewController = Ember.ObjectController.extend
  actions:
    createList: -> 
      title = @get('title')
      myList = @store.createRecord 'myList', {title: title}
      myList.save().then =>
        @transitionToRoute 'myList', myList

    #Fixme: why is this here? Is it just for 'down the road?'
    addItemToList: ->
      list = @get('model')
      
      list_item = @store.createRecord('list-item',
         my_list: list
         item: @get('selectedSong')
      )
      list_item.save()
      @set('selectedSong', null)
      #items.addObject @get('selectedSong')
      return



`export default MyListsNewController`