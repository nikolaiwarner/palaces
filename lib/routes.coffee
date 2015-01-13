Router.configure
  layoutTemplate: 'layout'

Router.route '/',
  name: 'page.landing'
  template: 'page_landing'
  onBeforeAction: ->
    if Meteor.user()
      Router.go("/palace/#{Meteor.userId()}")
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

Router.route '/projects/new',
  name: 'project.new'
  template: 'project_new'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      this.next()
  waitOn: ->
    Meteor.subscribe 'projects_by_user', Meteor.userId()

Router.route '/projects/:_id',
  name: 'project.show'
  template: 'project_show'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      this.next()
  waitOn: ->
    project_id = @params._id
    Meteor.subscribe 'project', project_id
    Meteor.subscribe 'participations_by_project', project_id
    Meteor.subscribe 'users'
    # Meteor.subscribe 'comments', 'Projects', @params._id
  data: ->
    project_id = @params._id
    id: project_id
    project: Projects.findOne(project_id)
    participants: Participations.find({ projectId: project_id })

Router.route '/projects/:_id/edit',
  name: 'project.edit'
  template: 'project_edit'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      this.next()
  waitOn: ->
    Meteor.subscribe 'projects_by_user', Meteor.userId()
  data: ->
    project_id = @params._id
    project: Projects.findOne(project_id)

Router.route '/palace/:_id',
  name: 'palace.show'
  template: 'palace_show'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      # Session.set('selectedUserId', @params._id)
      # Session.set('currentCommentableType', 'Users')
      # Session.set('currentCommentableId', @params._id)
      this.next()
  waitOn: ->
    user_id = @params._id
    Meteor.subscribe 'participations'
    Meteor.subscribe 'projects_by_user', user_id
    # Meteor.subscribe 'comments', 'Users', user_id
    Meteor.subscribe 'friendships'
    Meteor.subscribe 'tokens'
    Meteor.subscribe 'users'
  data: ->
    user_id = @params._id
    id: user_id
    user: Users.findOne user_id
