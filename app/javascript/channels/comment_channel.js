import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p><strong><%= link_to date.content.user.nickname, "/users/#{comment.user_id}" %>:</strong><%= date.content.text %></p>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    messages.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
});