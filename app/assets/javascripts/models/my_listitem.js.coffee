App.MyListItem = DS.Model.extend
  item: DS.belongsTo('item')
  mylist: DS.belongsTo('myList')
