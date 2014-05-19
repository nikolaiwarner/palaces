AutoForm.hooks
  projectForm:
    after:
      insert: (error, result, template) ->
        unless error
          Router.go("/projects/#{result}")
      update: (error, result, template) ->
        unless error
          Router.go("/projects/#{template.data.doc._id}")
      remove: (error, result, template) ->
        unless error
          Router.go("/projects/")

Template.project_form.helpers
  method: ->
    if Session.get("selectedProjectId") then 'update' else 'insert'
  currentProject: ->
    Projects.findOne({_id: Session.get("selectedProjectId")})
