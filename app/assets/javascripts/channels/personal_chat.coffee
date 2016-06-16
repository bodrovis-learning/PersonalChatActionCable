#jQuery ->
#  if $('#new_message').size() > 0 # we subscribe only when a new_message textarea is present on the page
## RE-WRITE THIS CONDITION AS NEEDED OR REMOVE COMPLETELY
#    App.global_chat = App.cable.subscriptions.create "GlobalChatChannel",
#      connected: ->
## Called when the subscription is ready for use on the server
#
#      disconnected: ->
## Called when the subscription has been terminated by the server
#
#      received: (data) ->
#        $('#messages').prepend data['message'] # place the received message on the page
#
#      send_message: (message) ->
#        @perform 'send_message', message: message # do the actual broadcasting
#
#
#    $('#new_message').submit (e) -> # this event happens when the message is actually submitted
#      input = $(this).find('#message_body')
#      unless $.trim(input.val()) is ''
#        App.global_chat.send_message input.val() # broadcast this message
#        input.val('')
#      e.preventDefault() # prevent the actual submitting of the form
#      return false
#
#    $('.global_chat_toggler').click -> # this is the "hide/show chat window" button
#      $(this).parents('.global_chat').toggleClass('collapsed')