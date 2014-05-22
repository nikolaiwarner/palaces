UI.registerHelper "username", (_id, options) ->
  return null unless _id
  if user=Users.findOne(_id: _id)
    user.profile.name

UI.registerHelper "user_path", (_id, options) ->
  "/friends/#{_id}"

UI.registerHelper "userIsCurrentUser", (_id, options) ->
  return null unless _id
  Meteor.userId() == _id

UI.registerHelper "avatar", (email, options) ->
  return null unless email
  Gravatar.imageUrl(email)
