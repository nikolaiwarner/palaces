Template.token_give.events
  'click .btn-give': (e, element) ->
    $token_give = $(e.currentTarget).parent()
    token_amount = parseInt($token_give.find('.amount').val(), 10)
    to_user_id = $token_give.find('.to_user_id').val()
    if token_amount > 0
      token =
        toUserId: to_user_id
        amount: token_amount
        projectId: $token_give.find('.project_id').val()
      if token_balance = Tokens.findOne({userId: Meteor.userId(), toUserId: to_user_id})
        Tokens.update {_id: token_balance._id}, {$inc: {amount: token_amount}}
      else
        Tokens.insert token

      if token_amount == 1
        token_string = 'a token'
      else
        token_string = "#{token_amount} tokens"
      FlashMessages.sendSuccess("You gave #{token_string}!")
    else
      FlashMessages.sendWarning("How many tokens?")
