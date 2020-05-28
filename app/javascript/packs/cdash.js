$(document).ready(function () {
  var count = $("body").data("count");
  $(".cart > span").addClass("counter");
  $(".cart > span.counter").text(count);
  $(".add-to-cart").click(function (event) {
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
    }, 600);
    event.preventDefault();
  });
});
