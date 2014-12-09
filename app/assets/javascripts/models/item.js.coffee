App.Item = DS.Model.extend
  title: DS.attr('string')
  mylists: DS.hasMany('myList')