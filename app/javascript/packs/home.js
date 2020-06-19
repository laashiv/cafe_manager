$(document).ready(function () {
  var duration = 500;
  jQuery(window).scroll(function () {
    if (jQuery(this).scrollTop() > 600) {
      jQuery("#home-nav").fadeOut(duration);
    } else {
      jQuery("#home-nav").fadeIn(duration);
    }
  });
});
