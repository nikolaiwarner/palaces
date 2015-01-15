Accounts.onCreateUser (options, user) ->
  if user.services && user.services.google
    email = user.services.google.email
    user.email_md5 = Gravatar.hash(email)

  if options.profile
    user.profile = options.profile
  return user
