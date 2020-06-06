$(document).ready(function () {
  $subtotal = $("#subtotal").html();
  $total = $("#total").html();
  $(".leftarrow").click(function () {
    var id = $(this).attr("id");
    $count = $("#quantity-counter" + id).html();
    $price = $("#price" + id).html();
    if ($count > 1) {
      $subtotal = parseFloat($subtotal) - parseFloat($price);
      $total = parseFloat($total) - parseFloat($price);
      $count--;
      $("#quantity-counter" + id).text($count);
      $("#subtotal").text($subtotal);
      $("#total").text($total);
      $("#leftform" + id).submit();
    }
  });
  /*$(".leftarrow").mousedown(function () {
    var id = $(this).attr("id");
    $("#" + id).css("BoxShadow", "0px 0px 0px gray");
  });
  $(".leftarrow").mouseup(function () {
    var id = $(this).attr("id");
    $("#" + id).css("BoxShadow", "0px 2px 1px gray");
  });*/
  $(".rightarrow").click(function () {
    var id = $(this).attr("id");
    $count = $("#quantity-counter" + id).html();
    $price = $("#price" + id).html();
    if ($count < 10) {
      $subtotal = parseFloat($subtotal) + parseFloat($price);
      $total = parseFloat($total) + parseFloat($price);
      $count++;
      $("#quantity-counter" + id).text($count);
      $("#subtotal").text($subtotal);
      $("#total").text($total);
      $("#rightform" + id).submit();
    }
  });
  /*$(".rightarrow").mousedown(function () {
    var id = $(this).attr("id");
    $("#" + id).css("BoxShadow", "0px 0px 0px gray");
  });
  $(".rightarrow").mouseup(function () {
    var id = $(this).attr("id");
    $("#" + id).css("BoxShadow", "0px 2px 1px gray");
  });*/
});
