import $ from 'jquery';
import axios from 'modules/axios';
import {
  listenInactiveFavoriteEvent,
  listenActiveFavoriteEvent
} from 'modules/handle_favorite'

const handleFavoriteDisplay = (hasFavorited) => {
  if (hasFavorited) {
   $('.active-heart').removeClass('hidden');
  } else {
    $('.inactive-heart').removeClass('hidden');
  }
}

const handleReplyForm = () => {
  $('.show-reply-form').on('click', () => {
    $('.show-reply-form').addClass('hidden');
    $('.reply-text-area').removeClass('hidden');
  })
}

const appendNewReply = (reply) => {
  $('.replies-container').append(`
    <div class="chat_reply">
      <p>${reply.content}</p>
    </div>
  `)
}

document.addEventListener('DOMContentLoaded', () => {
  const dataset = document.getElementById('chat-show').dataset;
  const chatId = dataset.chatId;

  // axios.get(`/chats/${chatId}/replies`)
  //   .then((response) => {
  //     const replies = response.data;
  //     replies.forEach((replies) => {
  //       appendNewReply(reply);
  //     });
  //   });

  handleReplyForm();

  $('.add-reply-button').on('click', () => {
    const content = $('#reply_content').val();
    if (!content) {
      window.alert('返信を入力してください');
    } else {
      axios.post(`/chats/${chatId}/replies`, {
          reply: { content: content }
        })
        .then((res) => {
          const reply = res.data;
          appendNewReply(reply);
          $('#reply_content').val('');
        })
        .catch((error) => {
          console.log(error);
        });
    }
  });

  // 「お気に入り」ボタンの状態を表示
  axios.get(`/chats/${chatId}/favorite`)
    .then((response) => {
      const hasFavorited = response.data.hasFavorited;
      handleFavoriteDisplay(hasFavorited);
    });

  listenInactiveFavoriteEvent(chatId);
  listenActiveFavoriteEvent(chatId);
});
