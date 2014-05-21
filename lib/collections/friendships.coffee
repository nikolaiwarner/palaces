@Friendships = new Meteor.Collection2 "friendships",
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

    toUserId:
      type: String
      denyUpdate: true

@Friendships.allow
  insert: (userId, doc) ->
    userId && (doc.userId == userId)

  update: (userId, doc, fieldNames, modifier) ->
    false

  remove: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)
