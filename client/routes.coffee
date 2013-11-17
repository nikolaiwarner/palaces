Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'home',
    path: '/'
    template: 'home'

  @route 'projects',
    path: '/projects'
    template: 'project_index'

  @route 'project',
    path: '/projects/:_id'
    template: 'project_show'
    # before:
    #   ->
    #     @subscribe('projects', @params._id).wait()
    # ,
    #   ->
    #     if @ready()
    #       NProgress.done()
    #     else
    #       NProgress.start()
    #       @stop()
