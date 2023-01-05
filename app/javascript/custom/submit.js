const btn = document.getElementById("message_body");
const sendBTN = document.getElementById("send");
const form = document.getElementById("msg-form");

const submit_message = () => {
  btn.addEventListener("keydown", (e) => {
    if (e.code == "Enter") {
      sendBTN.click();
      btn.value = "";
    }
  });
};

export default submit_message;
