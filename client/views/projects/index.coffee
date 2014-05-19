Template.project_index.helpers
  projects: ->
    Projects.find({userId: Meteor.userId()})
