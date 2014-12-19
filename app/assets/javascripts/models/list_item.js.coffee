App.ListItem = DS.Model.extend
  item: DS.belongsTo('item')
  my_list: DS.belongsTo('myList')
  
