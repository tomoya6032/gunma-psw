$(function() {
    var articleId = $('#article_id').val();
    $.getJSON('/articles/' + articleId, function(data) {
      $('.article_heart_count').text(data.like_count);
    });
  });
  