$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = function (e) {
  $('#img_prev').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
    }
  }
  $("#post_image").change(function(){
    readURL(this);
  });
});