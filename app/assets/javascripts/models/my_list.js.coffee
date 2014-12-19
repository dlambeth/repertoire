App.MyList = DS.Model.extend
  title: DS.attr('string')
  #items: DS.hasMany('item')
  listItems: DS.hasMany('listItem')

  #a computed property that returns a list of item ids from the 
  #listItems Array.  Used to filter out already listed songs in the pull down menu
  itemIdArray: (->
    itemArray = @.get('listItems').mapBy('item')
    itemArray.mapBy('id')
  ).property('listItems')
  