Meteor.publish "projects", (userId) ->
  Projects.find {}
