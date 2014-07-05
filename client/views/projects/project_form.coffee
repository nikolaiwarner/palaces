AutoForm.hooks
  projectForm:
    after:
      insert: (error, result, template) ->
        if error
          FlashMessages.sendWarning(error.message)
        else
          Router.go("/projects/#{result}")
          FlashMessages.sendSuccess("Created project.")
      update: (error, result, template) ->
        if error
          FlashMessages.sendWarning(error.message)
        else
          Router.go("/projects/#{template.data.doc._id}")
          FlashMessages.sendSuccess("Saved.")
      remove: (error, result, template) ->
        if error
          FlashMessages.sendWarning(error.message)
        else
          Router.go("/projects/")
          FlashMessages.sendSuccess("Removed project.")

Template.project_form.helpers
  method: ->
    if Session.get("selectedProjectId") then 'update' else 'insert'
  currentProject: ->
    Projects.findOne({_id: Session.get("selectedProjectId")})
