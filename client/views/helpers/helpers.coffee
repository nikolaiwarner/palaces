UI.registerHelper "formatTime", (context, options) ->
  options.format = options.format || "MM/DD/YYYY, hh:mma"
  moment(context).format(options.format) if context

UI.registerHelper "timeago", (context, options) ->
  moment(context).fromNow() if context
