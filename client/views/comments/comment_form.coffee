AutoForm.hooks
  commentForm:
    before:
      insert: (comment) ->
        comment.commentableType = Session.get("currentCommentableType")
        comment.commentableId = Session.get("currentCommentableId")
        comment

    after:
      insert: (error, result, template) ->
        unless error
          FlashMessages.sendSuccess("Posted message.")
      update: (error, result, template) ->
        unless error
          FlashMessages.sendSuccess("Updated message.")
      remove: (error, result, template) ->
        unless error
          FlashMessages.sendSuccess("Removed message.")

Template.comment_form.helpers
  method: ->
    if Session.get("selectedCommentId") then 'update' else 'insert'
  currentComment: ->
    Comments.findOne({_id: Session.get("selectedCommentId")})
