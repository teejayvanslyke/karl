$(function() {
  Karl.init();
  $(window).resize(function() { Karl.resize(); Karl.resize(); });
});

var Karl = {
  init: function() {
    this.resize();
    this.resize();
  },
  resize: function() {
    $('.container').height($(window).height()).
                    width($(window).width());
    $('.stack').each(function() {
      var parent   = $(this).parent();
      var elements = $(this).children('.stack_element');
      var elementHeight = parent.height() / elements.length;
      elements.css('height', elementHeight+'px');
      $(this).css('height', parent.height()+'px');
    });

    $('.flow').each(function() {
      var parent   = $(this).parent();
      var elements = $(this).children('.flow_element');
      var elementWidth = parent.width() / elements.length;
      elements.css('width', elementWidth+'px');
      $(this).css('width', parent.width()+'px');
      $(this).css('height', parent.height()+'px');
    });
  }
};
