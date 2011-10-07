(function($) {
  $.fn.extend({
    sticky: function() {
      var header = $(this),
          origTop = header.offset().top;

      $(window).scroll(function(e) {
        if ($(this).scrollTop() > origTop) {
          header.addClass("sticky");
        } else if ($(this).scrollTop() < origTop) {
          header.removeClass("sticky");
        }
      });
    }
  });
}(jQuery));

