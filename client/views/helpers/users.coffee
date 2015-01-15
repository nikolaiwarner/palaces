UI.registerHelper "username", (_id) ->
  return null unless _id
  if user=Users.findOne(_id: _id)
    user.profile.name

UI.registerHelper "user_path", (_id) ->
  "/palace/#{_id}"

UI.registerHelper "userIsCurrentUser", (_id) ->
  return null unless _id
  Meteor.userId() == _id

UI.registerHelper "avatar", (_id) ->
  return null unless _id
  if user=Users.findOne(_id: _id)
    if user.services && user.services.google
      url = user.services.google.picture
    else if user.email_md5
      url = Gravatar.imageUrl(email_md5)
    return url
