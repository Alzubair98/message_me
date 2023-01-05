const scroll_bottom = () => {
  if ($("#messages").length > 0) {
    $("#messages").scrollTop($("#messages")[0].scrollHeight);
  }
};

scroll_bottom();

export default scroll_bottom;
