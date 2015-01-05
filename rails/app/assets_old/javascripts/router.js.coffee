# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource('protected')

  @resource 'my_lists', path: '/my_lists', ->
    @resource 'my_list', path: '/my_lists/:id'
    @route 'new'
    #to start, let's show an item on it's own page
    @resource 'item', path: '/items/:id'
    @resource 'items', path: '/items', ->
    #  @route 'edit', path: '/items/:id/'
  