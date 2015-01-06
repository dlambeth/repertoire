`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route "application"
  @route "protected"
  @route "login"
  #@route "newuser"

  @resource 'my_lists', path: '/my_lists', ->
    @resource 'my_list', path: '/my_lists/:id'
    @route 'new'
    #to start, let's show an item on it's own page
    @resource 'item', path: '/items/:id'
    @resource 'items', path: '/items', ->
    #  @route 'edit', path: '/items/:id/'

`export default Router`
