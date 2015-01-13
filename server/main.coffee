Meteor.publish "comments", (commentableType, commentableId) ->
  Comments.find
    commentableType: commentableType
    commentableId: commentableId
  , sort: {createdAt: -1}

Meteor.publish "friendships", ->
  Friendships.find {}, sort: {createdAt: -1}

Meteor.publish "participations_by_user", (userId) ->
  Participations.find { userId: userId }, sort: {createdAt: -1}

Meteor.publish "project", (projectId) ->
  Projects.find({_id: projectId })

Meteor.publish "projects_by_user", (userId) ->
  Projects.find { userId: userId }, sort: {createdAt: -1}

Meteor.publish "tokens", ->
  Tokens.find {}, sort: {createdAt: -1}

Meteor.publish "users", ->
  # Meteor.users.find({}, {fields: {'profile': 1, 'email': 1}})
  Meteor.users.find({})
