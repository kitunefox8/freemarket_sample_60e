$(function(){
  $('.input-default').on('change',function(){
    if( $('.input-default').val()>=300){
      var Profit = $('.input-default').val()
      var Fee = $('.input-default').val()*0.1
      $('#l-left').append("¥ " + Fee);
      $('#l-left2').append("¥ " + (Profit - Fee));
    }
    if( $('.input-default').val()==""){
      $('#l-left,#l-left2').empty();    
    }
    return false
  });
});