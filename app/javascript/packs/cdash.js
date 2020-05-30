/*document.getElementsByClassName(.Add-cart-item).submit();*/
$(document).ready(function () {
  var count = $("body").data("count");
  $(".cart > span").addClass("counter");
  $(".cart > span.counter").text(count);
  $(".add-to-cart").click(function (event) {
    count++;
    $(".Add-cart-item").submit();
    /*$("someid").submit();*/
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
    /*document.getElementsByClassName(.Add-cart-item).submit();*/
    event.preventDefault();
  });
  r;
});
/*document.getElementById("someid").submit();*/
/*var form = document.getElementById("formid");
document.getElementById(".add-to-cart").addEventListener("");*/
/*function myFunction() {
  document.querySelector(.add-to-cart).submit();
}*/
/*document.getElementsByClassName(.Add-cart-item).submit();*/
