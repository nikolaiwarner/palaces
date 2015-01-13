Template.palace_show.events
  'click .btn-befriend': (e) ->
    friendship =
      toUserId: @user._id
    Friendships.insert friendship, (error, friendship_id) =>
      FlashMessages.sendSuccess("You made a friend!")
  'click .btn-unfriend': (e) ->
    console.log this._id
    Friendships.remove this._id, (error, friendship_id) =>
      FlashMessages.sendSuccess("You lost a friend.")

Template.palace_show.helpers
  friends: ->
    friendships = Friendships.find({ userId: @user._id })
    friends = []
    friendships.forEach (friendship) ->
      friends.push Users.findOne({_id: friendship.toUserId})
    friends
  project_participations: ->
    participations = Participations.find
      userId: @user._id
    projects = []
    participations.forEach (participation) ->
      projects.push Projects.findOne({_id: participation.projectId})
    projects
  userHasFriendship: ->
    friendship = Friendships.findOne
      userId: Meteor.userId()
      toUserId: @user._id
  canEdit: ->
    if user=Users.findOne({_id: @user._id})
      Meteor.userId() == @user._id
  owes_tokens: ->
    tokens = Tokens.find({ userId : @user._id })
    if tokens.count() > 0 then tokens else false
  owed_tokens: ->
    tokens = Tokens.find({ toUserId: @user._id })
    if tokens.count() > 0 then tokens else false
