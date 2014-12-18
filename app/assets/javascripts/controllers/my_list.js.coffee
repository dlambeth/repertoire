App.MyListController = Ember.ObjectController.extend(
  selectedSong: null

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




    