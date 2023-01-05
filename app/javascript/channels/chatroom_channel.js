import consumer from "channels/consumer";
import scroll_bottom from "custom/main";

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $("#message-container").append(data.body);
    scroll_bottom();

    // Called when there's incoming data on the websocket for this channel
  },
});
