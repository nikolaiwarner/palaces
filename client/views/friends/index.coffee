Template.friend_index.helpers
  all_friends: ->
    Friendships.find(Meteor.userId())
