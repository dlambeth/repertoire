`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route "application"
  #@route "protected"
  @route "login"
  #@route "newuser"

  @resource 'myLists', path: '/my-lists', ->
    @resource 'myList', path: '/:id'
    @route 'new'

    #to start, let's show an item on it's own page
    #@resource 'item', path: '/items/:id'
  @resource 'items', path: '/items', ->
    #@route 'edit', path: '/items/:id/'
    #@route 'new'
  
  #@resource 'items', path: '/items'
`export default Router`
