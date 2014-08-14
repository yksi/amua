$(document).on('mousedown', '.click-me', function(e) {
  $.ajax({
    url: '/test/get_last_user_fullname',
    type: 'GET',
    dataType: 'text'
  }).done(function(data) {
    alert(data);
  });
});