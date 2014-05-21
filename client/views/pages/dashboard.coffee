Template.page_dashboard.helpers
  my_projects: ->
    Projects.find({userId: Meteor.userId()})
  my_friends_projects: ->
    #TODO probably something like this:
    friend_ids = ['asdf', 'fdsaa']
    Projects.find({userId: {$in:friend_ids}})
  all_projects: ->
    Projects.find()
