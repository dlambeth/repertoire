`import Ember from 'ember'`

Item = DS.Model.extend
  title: DS.attr('string')
  #id:DS.attr('integer')
  mylists: DS.hasMany('myList')

`export default Item`