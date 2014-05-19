Meteor.startup ->
  Meteor.autosubscribe ->
    Meteor.subscribe "projects", Meteor.userId()
    Meteor.subscribe "responses"
