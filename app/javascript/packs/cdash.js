$(document).ready(function () {
  var count = $("body").data("count");
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
    }, 600);
    $("#" + id).hide();
    $(".Name").html().submit();
    event.preventDefault();
  });
});
