App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('connected')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('disconnected')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append data['message']

  emit: (message) ->
    @perform 'emit', message: message

#$('document').on 'submit', '[data-behavior~=room_emitter]', (event) ->
$(document).ready ->
  $('#client_form').submit ->
    # console.log('catching submit on form')
    msg = $('#msg_field').val()
    App.room.emit msg
    $('#msg_field').val('')
    false # similar to event.preventDefault()