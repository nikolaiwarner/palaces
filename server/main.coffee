Meteor.publish "projects", (userId) ->
  Projects.find {}

Meteor.publish "events", (userId) ->
  Events.find {}
