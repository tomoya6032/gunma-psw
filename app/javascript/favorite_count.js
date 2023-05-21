$(function() {
    var chatId = $('#chat_id').val();
    $.getJSON('/chats/' + chatId, function(data) {
      $('.chat_heart_count').text(data.favorite_count);
    });
  });
  