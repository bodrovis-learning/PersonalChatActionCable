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
      conversation = $('#conversation-body')
      if conversation.size() > 0 && conversation.data('conversation-id') is data['conversation_id']
        conversation.append data['message']
      else
        $('body').append(data['notification']) if data['notification']

    send_message: (message, conversation_id) ->
      @perform 'send_message', message: message, conversation_id: conversation_id

  $(document).on 'click', '#notification .close', ->
    $(this).parents('#notification').fadeOut(1000)

  $('.async-conversation').submit (e) ->
    console.log 'click'
    $this = $(this)
    textarea = $this.find('#personal_message_body')
    if $.trim(textarea.val()).length > 1
      App.personal_chat.send_message textarea.val(), $this.find('#conversation_id').val()
      textarea.val('')
    e.preventDefault()
    return false