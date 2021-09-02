import consumer from "./consumer";

const initChatroomCable = () => {
  let messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        // let messages = document.getElementById('messages');
        // console.log(messages);
        console.log(data);
        if (!document.querySelector(`${data.message_div_id} .message-container`)) {
          document.getElementById('messages').insertAdjacentHTML('beforeend', data.content);
          if (data.author_id !== document.getElementById('messages').dataset.userId) {
            document.querySelector(`${data.message_div_id} .message-container`).classList.remove('align-right');
          }
          document.querySelector(`${data.message_div_id} .message-container`).scrollIntoView({ behavior: "smooth" });
        }
        // console.log(data.message_div_id + " .message-container")
        // let messageDiv = document.querySelector(data.message_div_id + " .message-container")
      }
    });
  }
}

export { initChatroomCable };
