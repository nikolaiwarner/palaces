@Participations = new Meteor.Collection "participations"

participations_schema = new SimpleSchema
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

  projectId:
    type: String
    max: 50

  notes:
    type: String
    max: 1000
    optional: true

@Participations.attachSchema(participations_schema, {transform: true})

@Participations.allow
  insert: (userId, doc) ->
    userId && (doc.userId == userId)

  update: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)

  remove: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)

@Participations.deny
  update: (userId, docs, fields, modifier) ->
    return _.contains(fields, 'userId') # User can't change owner of doc
