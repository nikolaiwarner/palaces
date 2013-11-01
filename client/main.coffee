Meteor.startup ->
  Meteor.autosubscribe ->
    Meteor.subscribe "projects", Meteor.userId()
    Meteor.subscribe "events", Meteor.userId()
