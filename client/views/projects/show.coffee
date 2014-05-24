Template.project_show.events
  'click .btn-join': (e) ->
    participation =
      projectId: Session.get('selectedProjectId')
    Participations.insert participation, (error, participation_id) =>
      FlashMessages.sendSuccess("Joined project.")
  'click .btn-leave': (e) ->
    Participations.remove this._id, (error, participation_id) =>
      FlashMessages.sendSuccess("Left project.")

Template.project_show.helpers
  participants: ->
    Participations.find
      projectId: Session.get('selectedProjectId')
  canEdit: ->
    if project=Projects.findOne({_id: Session.get('selectedProjectId')})
      Meteor.userId() == project.userId
  userIsParticipating: ->
    participation = Participations.findOne
      userId: Meteor.userId()
      projectId: Session.get('selectedProjectId')
    participation
