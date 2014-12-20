Router.configure
  layoutTemplate: 'layout'

Router.route '/',
  name: 'page.landing'
  template: 'page_landing'
  onBeforeAction: ->
    if Meteor.user()
      Router.go('/dashboard')
    else
      this.next()

Router.route '/dashboard',
  name: 'page.dashbaord'
  template: 'page_dashboard'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      this.next()
  waitOn: ->
    Meteor.subscribe 'projects'

Router.route '/projects/new',
  name: 'project.new'
  template: 'project_new'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      this.next()
  waitOn: ->
    Meteor.subscribe 'projects'

Router.route '/projects/:_id',
  name: 'project.show'
  template: 'project_show'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      console.log @params
      this.next()
  waitOn: ->
    Meteor.subscribe 'projects'
    Meteor.subscribe 'participations'
  data: ->
    id = @params._id
    id: id
    project: Projects.findOne(id)
    participants: Participations.find({ projectId: id })


  # @route 'projects',
  #   path: '/projects'
  #   template: 'project_index'
  #   onBeforeAction: ->
  #     # if !Meteor.user()
  #     #   Router.go('/')
  #     Session.set('selectedProjectId', undefined)
  #   waitOn: ->
  #     Meteor.subscribe 'projects'
  #
  # @route 'projects/new',
  #   path: '/projects/new'
  #   template: 'project_new'
  #   onBeforeAction: ->
  #     # if !Meteor.user()
  #     #   Router.go('/')
  #     Session.set('selectedProjectId', undefined)
  #
  # @route 'project',
  #   path: '/projects/:_id'
  #   template: 'project_show'
  #   onBeforeAction: ->
  #     # if !Meteor.user()
  #     #   Router.go('/')
  #     Session.set('selectedProjectId', @params._id)
  #     Session.set('currentCommentableType', 'Projects')
  #     Session.set('currentCommentableId', @params._id)
  #   waitOn: ->
  #     Meteor.subscribe 'participations'
  #     Meteor.subscribe 'users'
  #     Meteor.subscribe 'comments',
  #       commentableType: 'Projects'
  #       commentableId: @params._id
  #     Meteor.subscribe 'projects', Meteor.userId(), sort: {createdAt: -1}
  #   data: ->
  #     Projects.findOne @params._id
  #
  # @route 'project_edit',
  #   path: 'projects/:_id/edit',
  #   template: 'project_edit'
  #   onBeforeAction: ->
  #     # if !Meteor.user()
  #     #   Router.go('/')
  #     Session.set('selectedProjectId', @params._id)
  #   waitOn: ->
  #     Meteor.subscribe 'projects', Meteor.userId()
  #   data: ->
  #     Projects.findOne @params._id


Router.route '/friends/:_id',
  name: 'friend_show'
  template: 'friend_show'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      Session.set('selectedUserId', @params._id)
      Session.set('currentCommentableType', 'Users')
      Session.set('currentCommentableId', @params._id)
      this.next()
  waitOn: ->
    Meteor.subscribe 'participations'
    Meteor.subscribe 'projects'
    Meteor.subscribe 'comments', 'Users', @params._id
    Meteor.subscribe 'friendships'
    Meteor.subscribe 'tokens'
    Meteor.subscribe 'users'
  data: ->
    id = @params._id
    id: id
    user: Users.findOne id
