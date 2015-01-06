`import Ember from 'ember'`
`import startApp from 'repember/tests/helpers/start-app'`
`import Ember from 'ember'`


module 'Integration - Landing Page', 
  setup: ->
    App = startApp();
  
  #Fix me, what should we do on teardown?
  #teardown: ->
    #Ember.run(App, 'destroy')
    #App.reset()

test 'Should welcome me to Repertoire Ember', ->
  visit('/').then( ->
    equal(find('h2#title').text(), 'Welcome to Repertoire Ember');
  )

