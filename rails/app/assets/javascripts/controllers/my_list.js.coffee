App.MyListController = Ember.ObjectController.extend(
  selectedSong: null

  songLibrary: (->
    that = @
    @store.filter('item', (item) ->
      !(that.get('model').get('itemIdArray').contains(item.id))
    )
  ).property('listItems')

  actions:
    saveChanges: -> 
      @get('model').save()
      return

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

)




    