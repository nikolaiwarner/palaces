UI.registerHelper "username", (_id, options) ->
  if _id
    user = Users.findOne(_id: _id)
    console.log user
    user.profile.name
