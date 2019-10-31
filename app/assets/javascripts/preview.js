$(function(){
  $('.form').on('change', 'input[type="file"]', function(e) {
    console.log(this);
    var file = e.target.files[0],
        reader = new FileReader(),
        previewArea = $('.preview');

    reader.onload = (function() {
      return function(e) {
        previewArea.empty();
        previewArea.append($('<img>').attr({
                  src: e.target.result,
                  class: "preview"
              }));
      };
    })
    (file);
    reader.readAsDataURL(file);
  });
});