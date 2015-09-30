App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $message = $('<div/>').addClass('message').attr('message-id', data.id).appendTo('.message-board');
    $user_info = $('<div/>').addClass('user-info').text(data.username).appendTo($message);
    $message_text = $('<div/>').text(data.message).addClass('message-text').appendTo($message);

  }
});
