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
    Meteor.subscribe 'users'
    Meteor.subscribe 'comments', 'Projects', @params._id
  data: ->
    id = @params._id
    id: id
    project: Projects.findOne(id)
    participants: Participations.find({ projectId: id })

Router.route '/projects/:_id/edit',
  name: 'project.edit'
  template: 'project_edit'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      this.next()
  waitOn: ->
    Meteor.subscribe 'projects', Meteor.userId()
  data: ->
    project: Projects.findOne @params._id

Router.route '/friends/:_id',
  name: 'friend_show'
  template: 'friend_show'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      # Session.set('selectedUserId', @params._id)
      # Session.set('currentCommentableType', 'Users')
      # Session.set('currentCommentableId', @params._id)
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
