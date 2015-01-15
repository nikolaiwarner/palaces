@Tokens = new Meteor.Collection "tokens"

tokens_schema = new SimpleSchema
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

  toUserId:
    type: String
    max: 50

  amount:
    type: Number

  projectId:
    type: String
    max: 50
    optional: true

  note:
    type: String
    max: 1000
    optional: true

@Tokens.attachSchema(tokens_schema, {transform: true})

@Tokens.allow
  insert: (userId, doc) ->
    userId && (doc.userId == userId)

  update: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)

  remove: (userId, doc, fieldNames, modifier) ->
    userId && ((doc.userId == userId) || (doc.toUserId == userId))

@Tokens.deny
  update: (userId, docs, fields, modifier) ->  
    return _.contains(fields, 'userId') # User can't change owner of doc
