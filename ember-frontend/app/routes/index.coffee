`import Ember from 'ember'`
`import Session from 'simple-auth/session'`

IndexRoute = Ember.Route.extend
  model: ->

  beforeModel: ->
    if @.session.isAuthenticated
     console.log 'session is authenticated'
     @.transitionTo('myLists')

`export default IndexRoute`