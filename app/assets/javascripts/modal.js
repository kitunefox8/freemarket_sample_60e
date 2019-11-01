$(document).on("turbolinks:load", function(){
  $('.mercari__brand').on('click', function() {
    $('#overlay').fadeIn();
    document.getElementById('modal-close-btn').onclick = function () {
      $('#overlay').fadeOut();
    };
  });
});