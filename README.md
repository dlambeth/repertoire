# repertoire
This is a little app I am building to teach myself Ember.js.  I'm a musician and need a way to build set lists for my performances. This app lets the user build a song library, and then add those songs to set playlists.   While it supports add/delete/edit for both the songs and lists at this point, it's very much a work in progress.

The backend API is a Rail 4 application.  It uses Devise for the user authentication and Active Model Serializer for the JSON serialization.  

The frontend is an Ember.js application built using Ember-cli. Dependencies include Ember Simple Auth for for Devise support and Ember Data for communicating with the backend. 

On my laundry list of todo's
* Write install/run documentation
* Write a couple blog posts about useful tricks in Ember.js
* Ember.js tests
* Rails tests
* Nicer UI
* Support for creating users
* Check for correct user in API calls
