Template.project_show.events
  'click .btn-join': (e) ->
    participation =
      projectId: Session.get('selectedProjectId')
    Participations.insert participation, (error, participation_id) =>
      console.log 'Participations.insert', error, participation_id
  'click .btn-leave': (e) ->
    Participations.remove this._id, (error, participation_id) =>
      console.log 'Participations.remove', error, participation_id

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
