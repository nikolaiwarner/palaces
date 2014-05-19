Meteor.publish "projects", (userId) ->
  Projects.find {}, sort: {createdAt: -1}

Meteor.publish "comments", (options={}) ->
  Comments.find options, sort: {createdAt: -1}

Meteor.publish "users", (options={}) ->
  Meteor.users
