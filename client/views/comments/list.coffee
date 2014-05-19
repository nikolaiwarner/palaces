Template.comment_list.helpers
  commentableType: ->
    Session.get("currentCommentableType")
  commentableId: ->
    Session.get("currentCommentableId")

  comments: ->
    Comments.find
      commentableType: Session.get("currentCommentableType")
      commentableId: Session.get("currentCommentableId")
    , sort: {createdAt: -1}
