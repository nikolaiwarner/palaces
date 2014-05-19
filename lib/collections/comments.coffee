class @Response extends Commentable
  @_collection = new Meteor.Collection 'responses'

  before_comment: (comment) ->
    # Tag the comment with this userid for whatever reason
    # if something.userId is Meteor.userId()
    #   comment.notify.push Meteor.userId()
    comment
