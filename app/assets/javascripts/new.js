$(function(){
  $('.input-default').on('keyup',function(){
    $('#l-left,#l-left2').empty();
    
    var Input = $('.input-default').val()
    var Fee = Math.floor($('.input-default').val()*0.1)

    if(Input >= 300 && Input <= 9999999){
      $('#l-left').append("¥ " + Fee);
      $('#l-left2').append("¥ " + (Input - Fee));
    }
    if( $('.input-default').val()==""){
      $('#l-left,#l-left2').empty();    
    }
    return false
  });
});