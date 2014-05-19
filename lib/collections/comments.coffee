@Comments = new Meteor.Collection2 "comments",
  schema:
    userId:
      type: String
      denyUpdate: true
      autoValue: ->
        if @isInsert
          Meteor.userId()

    createdAt:
      type: Date
      denyUpdate: true
      autoValue: ->
        if @isInsert
          new Date()

    updatedAt:
      type: Date
      denyInsert: true
      optional: true
      autoValue: ->
        if @isUpdate
          new Date()

    commentableType:
      type: String
      max: 50

    commentableId:
      type: String
      max: 50

    comment:
      type: String
      max: 255

    comment:
      type: String
      max: 1000


@Comments.allow
  insert: (userId, doc) ->
    userId && (doc.userId == userId)

  update: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)

  remove: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)
