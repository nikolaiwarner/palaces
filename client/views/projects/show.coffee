Template.project_show.events
  'click .btn-join': (e) ->
    participation =
      projectId: Session.get('selectedProjectId')
    Participations.insert participation, (error, participation_id) =>
      if error
        FlashMessages.sendWarning(error.message)
      else
        FlashMessages.sendSuccess("Joined project.")
  'click .btn-leave': (e) ->
    Participations.remove this._id, (error, participation_id) =>
      FlashMessages.sendSuccess("Left project.")
  'click .btn-complete': (e) ->
    Projects.update {_id: this._id}, $set: {status: 'complete'}, (error, project_id) =>
      FlashMessages.sendSuccess("Saved.")
  'click .btn-in-progress': (e) ->
    Projects.update {_id: this._id}, $set: {status: 'in progress'}, (error, project_id) =>
      FlashMessages.sendSuccess("Saved.")

Template.project_show.helpers
  participants: ->
    Participations.find
      projectId: Session.get('selectedProjectId')
  canEdit: ->
    if project=Projects.findOne({_id: Session.get('selectedProjectId')})
      Meteor.userId() == project.userId
  isComplete: ->
    @status == 'complete'
  userIsParticipating: ->
    participation = Participations.findOne
      userId: Meteor.userId()
      projectId: Session.get('selectedProjectId')
    participation
