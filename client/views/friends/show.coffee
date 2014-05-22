Template.friend_show.events
  'click .btn-befriend': (e) ->
    friendship =
      toUserId: Session.get('selectedUserId')
    Friendships.insert friendship, (error, friendship_id) =>
      console.log 'Friendships.insert', error, friendship_id
  'click .btn-unfriend': (e) ->
    console.log this._id
    Friendships.remove this._id, (error, friendship_id) =>
      console.log 'Friendships.remove', error, friendship_id

Template.friend_show.helpers
  friends: ->
    friendships = Friendships.find
      userId: Session.get('selectedUserId')
    friends = []
    friendships.forEach (friendship) ->
      friends.push Users.findOne({_id: friendship.toUserId})
    friends
  projects: ->
    Projects.find
      userId: Session.get('selectedUserId')
  project_participations: ->
    participations = Participations.find
      userId: Session.get('selectedUserId')
    projects = []
    participations.forEach (participation) ->
      projects.push Projects.findOne({_id: participation.projectId})
    projects
  userHasFriendship: ->
    friendship = Friendships.findOne
      userId: Meteor.userId()
      toUserId: Session.get('selectedUserId')
  canEdit: ->
    if user=Users.findOne({_id: Session.get('selectedUserId')})
      Meteor.userId() == user._id
