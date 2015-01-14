`import Ember from 'ember'`

MyListController = Ember.ObjectController.extend
  selectedSong: null

  songLibrary: (->
    that = @
    @store.filter('item', (item) ->
      !(that.get('model').get('itemIdArray').contains(item.id))
    )
  ).property('listItems')

  onSelectedSongChange: (->
    if @get('selectedSong')?
      list = @get('model')
      
      list_item = @store.createRecord('list-item',
        my_list: list
        item: @get('selectedSong')
      )
      list_item.save()
      @set('selectedSong', null)
        
  ).observes('selectedSong')

  actions:
    saveChanges: -> 
      @get('model').save()
      return

    delete: ->
      @get('model').destroyRecord()


`export default MyListController`