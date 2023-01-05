import consumer from "channels/consumer";
import scroll_bottom from "custom/main";
import submit_message from "custom/submit";

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $("#message-container").append(data.body);
    submit_message();
    scroll_bottom();

    // Called when there's incoming data on the websocket for this channel
  },
});
