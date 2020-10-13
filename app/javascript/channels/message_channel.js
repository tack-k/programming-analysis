import consumer from "./consumer"



consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `

    <div class="message-wrapper-right">
      <div class="message-date">
      <P>${data.content.created_at}</P>
      </div>
      <div class="message-content">
      <P>${data.content.message}</P>
      </div>
    </div>`
    ;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message-text');
    const submitMessage = document.getElementById('message-submit');

    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value = '';
    submitMessage.disabled = false;

  }
});
