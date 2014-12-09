# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  # @resource('posts')
  @resource 'my_lists', path: '/', ->
      @resource 'my_list', path: '/my_lists/:id'
