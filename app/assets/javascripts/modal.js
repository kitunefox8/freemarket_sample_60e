$(function(){
  $('.mercari__brand').on('click', function() {
    $('#overlay').fadeIn();
    document.getElementById('modal-close-btn').onclick = function () {
      $('#overlay').fadeOut();
    };
  });
});

$(function(){
  $('.btn-facebook').on('click', function() {
    $('#overlay').fadeIn();
    document.getElementById('modal-close-btn').onclick = function () {
      $('#overlay').fadeOut();
    };
  });
});

$(function(){
  $('.btn-google').on('click', function() {
    $('#overlay').fadeIn();
    document.getElementById('modal-close-btn').onclick = function () {
      $('#overlay').fadeOut();
    };
  });
});

$(function(){
  $('.btn-mail').on('click', function() {
    $('#overlay').fadeIn();
    document.getElementById('modal-close-btn').onclick = function () {
      $('#overlay').fadeOut();
    };
  });
});