App.messages = App.cable.subscriptions.create('SessionsChannel', {
  received: function(data) {
    if(data.create){
      if($(".online-users[user-id='"+ data.id +"']").length <= 0)
        $('<div/>').addClass('online-users').attr('user-id', data.id).text(data.name).appendTo('.participants');
    }else
      $(".online-users[user-id='" + data.id + "']").remove();
  }
});
