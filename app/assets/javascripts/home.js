$(function(){
  $('.input').keypress(function(e){
    if(e.which == 13){
      if($('textarea').val().length>0){
        $.post('/messages/', { message: $('textarea').val() });
        $('textarea').val('');
      }
      e.preventDefault();
    }
  })
})
