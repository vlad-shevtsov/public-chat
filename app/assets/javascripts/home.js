$(function(){
  $('.input').keypress(function(e){
    if(e.which is 13){
      alert('lol');
      if($('textarea').val().length>0){
        $.post('/messages/', { message: $('textarea').val() });

        $('textarea').val('');
      }
      e.preventDefault();
    }
  })
})
