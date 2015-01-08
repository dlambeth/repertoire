`import DS from 'ember-data'`

ListItem = DS.Model.extend
  item: DS.belongsTo('item')
  my_list: DS.belongsTo('myList')

`export default ListItem`