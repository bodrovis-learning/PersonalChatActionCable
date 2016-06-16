jQuery ->
  if $('#current-user').size() > 0
    App.personal_chat = App.cable.subscriptions.create {
      channel: "NotificationsChannel"
      user_id: $('#current-user').data('id')
    },
    connected: ->
  # Called when the subscription is ready for use on the server

    disconnected: ->
  # Called when the subscription has been terminated by the server

    received: (data) ->
      $('body').append data['notification'] # place the received message on the page

  $(document).on 'click', '#notification .close', ->
    $(this).parents('#notification').fadeOut(1000)