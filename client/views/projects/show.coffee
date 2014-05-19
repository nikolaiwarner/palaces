Template.project_show.helpers
  events: ->
    Events.find
      userId: Meteor.userId()
      projectId: Session.get('selectedProjectId')
