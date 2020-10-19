import consumer from "./consumer"

function scrollToEnd() {
  const messagesArea = document.getElementById('messages');
  messagesArea.scrollTop = messagesArea.scrollHeight;
}

function pullDown() {

  scrollToEnd() 
}

window.addEventListener('turbolinks:load', pullDown)

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

    const Messages = document.getElementById('message');
    const newMessage = document.getElementById('message-text');
    const submitMessage = document.getElementById('message-submit');

    if (data.content.user_id === null) {
      Messages.insertAdjacentHTML('beforeend', htmlLeft);
      scrollToEnd()
    } else {
      Messages.insertAdjacentHTML('beforeend', htmlRight);
      scrollToEnd()
    }
    newMessage.value = '';
    submitMessage.disabled = false;
  

  }


});




