AutoForm.hooks
  commentForm:
    before:
      insert: (comment) ->
        comment.commentableType = Session.get("currentCommentableType")
        comment.commentableId = Session.get("currentCommentableId")
        comment

    after:
      insert: (error, result, template) ->
        # unless error
        #   Router.go("/comments/#{result}")
      update: (error, result, template) ->
        # unless error
        #   Router.go("/comments/#{template.data.doc._id}")
      remove: (error, result, template) ->
        # unless error
        #   Router.go("/comments/")

Template.comment_form.helpers
  method: ->
    if Session.get("selectedCommentId") then 'update' else 'insert'
  currentComment: ->
    Comments.findOne({_id: Session.get("selectedCommentId")})
