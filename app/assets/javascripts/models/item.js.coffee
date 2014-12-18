App.Item = DS.Model.extend
  title: DS.attr('string')
  #id:DS.attr('integer')
  mylists: DS.hasMany('myList')