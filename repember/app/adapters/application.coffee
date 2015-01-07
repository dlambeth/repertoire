`import DS from 'ember-data'`

ApplicationAdapter = DS.ActiveModelAdapter.extend(
    #eventually we'll add a namespace
    #namespace: 'api/v1',
#    host:'http://localhost:3000'
)

`export default ApplicationAdapter`
