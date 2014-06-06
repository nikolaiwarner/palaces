@Projects = new Meteor.Collection "projects",
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

    status:
      type: String
      max: 50

    name:
      type: String
      max: 50

    date:
      type: Date
      optional: true

    description:
      type: String
      max: 1000
      optional: true


@Projects.allow
  insert: (userId, doc) ->
    userId && (doc.userId == userId)

  update: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)

  remove: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)
