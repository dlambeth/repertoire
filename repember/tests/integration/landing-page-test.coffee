`import Ember from 'ember'`
`import startApp from 'repember/tests/helpers/start-app'`
`import Ember from 'ember'`

App

module 'Integration - Landing Page', 
  setup: ->
    App = startApp();
  
  teardown: ->
    Ember.run(App, 'destroy')

test 'Should welcome me to Boston Ember', ->
  visit('/').then( ->
    equal(find('h2#title').text(), 'Welcome to Boston Ember');
  )

