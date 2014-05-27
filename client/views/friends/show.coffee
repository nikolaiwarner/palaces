Template.friend_show.events
  'click .btn-befriend': (e) ->
    friendship =
      toUserId: Session.get('selectedUserId')
    Friendships.insert friendship, (error, friendship_id) =>
      FlashMessages.sendSuccess("You made a friend!")
  'click .btn-unfriend': (e) ->
    console.log this._id
    Friendships.remove this._id, (error, friendship_id) =>
      FlashMessages.sendSuccess("You lost a friend.")

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
  owes_tokens: ->
    Tokens.find
      userId: Session.get('selectedUserId')
  owed_tokens: ->
    Tokens.find
      toUserId: Session.get('selectedUserId')
