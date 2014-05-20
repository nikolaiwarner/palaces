Router.configure
  layoutTemplate: 'layout'

Router.onBeforeAction('loading')

Router.map ->
  @route 'home',
    path: '/'
    template: 'home'

  @route 'projects',
    path: '/projects'
    template: 'project_index'
    onBeforeAction: ->
      # if !Meteor.user()
      #   Router.go('/')
      Session.set("selectedProjectId", undefined)
    waitOn: ->
      Meteor.subscribe "projects"

  @route 'projects/new',
    path: '/projects/new'
    template: 'project_new'
    onBeforeAction: ->
      # if !Meteor.user()
      #   Router.go('/')
      Session.set("selectedProjectId", undefined)

  @route 'project',
    path: '/projects/:_id'
    template: 'project_show'
    onBeforeAction: ->
      # if !Meteor.user()
      #   Router.go('/')
      Session.set("selectedProjectId", @params._id)
      Session.set("currentCommentableType", 'Projects')
      Session.set("currentCommentableId", @params._id)
    waitOn: ->
      Meteor.subscribe "participations"
      Meteor.subscribe "users"
      Meteor.subscribe "comments",
        commentableType: 'Projects'
        commentableId: @params._id
      Meteor.subscribe "projects", Meteor.userId(), sort: {createdAt: -1}
    data: ->
      Projects.findOne @params._id

  @route 'project_edit',
    path: 'projects/:_id/edit',
    template: 'project_edit'
    onBeforeAction: ->
      # if !Meteor.user()
      #   Router.go('/')
      Session.set("selectedProjectId", @params._id)
    waitOn: ->
      Meteor.subscribe "projects", Meteor.userId()
    data: ->
      Projects.findOne @params._id
