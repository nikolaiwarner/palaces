UI.registerHelper "formatTime", (context, options={}) ->
  return null unless context
  options.format = options.format || "MM/DD/YYYY, hh:mma"
  moment(context).format(options.format)

UI.registerHelper "formatDate", (context, options={}) ->
  return null unless context
  options.format = options.format || "MM/DD/YYYY"
  moment(context).format(options.format)

UI.registerHelper "timeago", (context, options) ->
  return null unless context
  moment(context).fromNow()
