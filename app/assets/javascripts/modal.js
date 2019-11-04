$(function(){
  $('.mercari__brand').on('click', function() {
    $('#overlay').fadeIn();
    document.getElementById('modal-close-btn').onclick = function () {
      $('#overlay').fadeOut();
    };
  });
});

$(document).on('page:load', ready, function(){
  $('.btn-facebook').on('click', function() {
    $('#overlay').fadeIn();
    document.getElementById('modal-close-btn').onclick = function () {
      $('#overlay').fadeOut();
    };
  });
});

$(document).on('page:load', ready, function(){
  $('.btn-google').on('click', function() {
    $('#overlay').fadeIn();
    document.getElementById('modal-close-btn').onclick = function () {
      $('#overlay').fadeOut();
    };
  });
});

$(document).on('page:load', ready, function(){
  $('.btn-mail').on('click', function() {
    $('#overlay').fadeIn();
    document.getElementById('modal-close-btn').onclick = function () {
      $('#overlay').fadeOut();
    };
  });
});