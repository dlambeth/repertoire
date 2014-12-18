App.MyList = DS.Model.extend
  title: DS.attr('string')
  #items: DS.hasMany('item')
  listItems: DS.hasMany('listItem')
  