Meteor.publish "comments", (options={}) ->
  Comments.find options, sort: {createdAt: -1}

Meteor.publish "friendships", (options={}) ->
  Friendships.find options, sort: {createdAt: -1}

Meteor.publish "participations", (options={}) ->
  Participations.find options, sort: {createdAt: -1}

Meteor.publish "projects", () ->
  Projects.find {}, sort: {createdAt: -1}

Meteor.publish "tokens", (options={}) ->
  Tokens.find options, sort: {createdAt: -1}

Meteor.publish "users", (options={}) ->
  # Meteor.users.find({}, {fields: {'profile': 1, 'email': 1}})
  Meteor.users.find({})
