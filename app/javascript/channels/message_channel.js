import consumer from "./consumer"



consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const htmlLeft = `
      <div class="message-wrappwer-left">
      <div class="message-date">
      <P>${data.content.created_at}</P>
      </div>
      <div class="message-content message-left">
      <P>${data.content.message}</P>
      </div>
      </div>`;

    const htmlRight = `
      <div class="message-wrapper-right">
      <div class="message-date">
      <P>${data.content.created_at}</P>
      </div>
      <div class="message-content message-right">
      <P>${data.content.message}</P>
      </div>
      </div>`;

    const Messages = document.getElementById('messages');
    const newMessage = document.getElementById('message-text');
    const submitMessage = document.getElementById('message-submit');

    if (data.content.user_id === null) {
      Messages.insertAdjacentHTML('afterbegin', htmlLeft);
    } else {
      Messages.insertAdjacentHTML('afterbegin', htmlRight);
    }
    newMessage.value = '';
    submitMessage.disabled = false;

  }
});




