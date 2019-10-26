$(document).on("turbolinks:load",function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div id='child-wrap'>
                        <select id="child_category" name="product[category_id]">
                          <option value="---" data-category="---">---</option>
                          ${insertHTML}
                        </select>
                      </div>`;
    $('#form-group').append(childSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div id='grandchild_wrap'>
                              <select id="grandchild_category" name="product[category_id]">
                                <option value="---" data-category="---">---</option>
                                ${insertHTML}
                              </select>
                            </div>`;
    $('#form-group').append(grandchildSelectHtml);
  }

  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory.length != 0){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#child-wrap').remove();
        $('#grandchild_wrap').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗');
      })
    }
    else{
      $('#child-wrap').remove();
      $('#grandchild_wrap').remove();
    }
  });

  $('#form-group').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    console.log(this);
    if (childId != "---"){ 
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        console.log(grandchildren);
        if (grandchildren.length != 0) {
          $('#grandchild_wrap').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗');
      })
    }
    else{
      $('#grandchild_wrap').remove(); 
    }
  });
});