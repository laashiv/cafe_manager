$(document).ready(function () {
  var count = $("body").data("count");
  var duration = 500;
  /*var id = $(".Name").html();*/
  $(".cart > span").addClass("counter");
  $(".cart > span.counter").text(count);
  $(".add-to-cart").click(function (event) {
    var id = $(this).attr("id");
    count++;
    $(".add-to-cart").addClass("size");
    setTimeout(function () {
      $(".add-to-cart").addClass("hover");
    }, 200);
    setTimeout(function () {
      $(".cart > span").addClass("counter");
      $(".cart > span.counter").text(count);
    }, 400);
    setTimeout(function () {
      $(".add-to-cart").removeClass("hover");
      $(".add-to-cart").removeClass("size");
      $("#" + id).hide();
    }, 600);
    $(".Name").html().submit();
    event.preventDefault();
  });

  jQuery(window).scroll(function () {
    if (jQuery(this).scrollTop() > 600) {
      jQuery(".to-top").fadeIn(duration);
    } else {
      jQuery(".to-top").fadeOut(duration);
    }
  });

  /*$("#search-btn").click(function (event) {
    var box = $($("#this").attr("toggle"));
    var value = box.attr("value");
    $(this).attr("href", value);
  });*/
});
