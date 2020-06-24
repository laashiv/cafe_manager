$(document).ready(function () {
  $subtotal = $("#subtotal").html();
  $total = $("#total").html();
  $(".leftarrow").click(function () {
    var id = $(this).attr("id");
    $count = $("#quantity-counter" + id).html();
    $price = $("#price" + id).html();
    if ($count > 1) {
      $subtotal = parseFloat($subtotal) - parseFloat($price);
      $total =
        parseFloat($total) - parseFloat($price) - parseFloat($price) * 0.18;
      $count--;
      $("#quantity-counter" + id).text($count);
      $("#subtotal").text($subtotal.toFixed(1));
      $("#total").text($total.toFixed(1));
      $("#leftform" + id).submit();
      $("#coupan-text").val("");
    }
  });
  $(".rightarrow").click(function () {
    var id = $(this).attr("id");
    $count = $("#quantity-counter" + id).html();
    $price = $("#price" + id).html();
    if ($count < 10) {
      $subtotal = parseFloat($subtotal) + parseFloat($price);
      $total =
        parseFloat($total) + parseFloat($price) + parseFloat($price) * 0.18;
      $count++;
      $("#quantity-counter" + id).text($count);
      $("#subtotal").text($subtotal.toFixed(1));
      $("#total").text($total.toFixed(1));
      $("#rightform" + id).submit();
      $("#coupan-text").val("");
    }
  });
});
