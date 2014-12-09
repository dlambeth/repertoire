App.MyList = DS.Model.extend
  title: DS.attr('string')
  items: DS.hasMany('item')
  