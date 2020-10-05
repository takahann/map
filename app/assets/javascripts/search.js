$(function() {
  $('.search-trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('#search-menu').fadeToggle();
    event.preventDefault();
  });
});