`import DS from 'ember-data'`

Item = DS.Model.extend
  title: DS.attr('string')
  #id:DS.attr('integer')
  mylists: DS.hasMany('myList')
  listItems: DS.hasMany('listItem')

`export default Item`