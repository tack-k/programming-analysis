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


      <div class="message-date">
      <P>${data.content.created_at}</P>
      </div>
      <div class="message-content">
      <P>${data.content.message}</P>
      </div>`
    ;
    const messageAdmin = document.getElementsByClassName('message-admin');
    const messageUser = document.getElementsByClassName('message-user');
    const newMessage = document.getElementById('message-text');
    const submitMessage = document.getElementById('message-submit');

    if (data.content.user_id === null) {
    messageAdmin[0].insertAdjacentHTML('afterbegin', html);
  } else {
    messageUser[0].insertAdjacentHTML('afterbegin', html);
    
    }
    newMessage.value = '';
    submitMessage.disabled = false;

  }
});
