jQuery(document).ready(function($) {
  $('#up').bind('mouseup',total_price_up);
  $('#down').bind('mouseup',total_price_down);
  quantity=$('#quantity').val()
  function total_price_up()
  {
    quantity++;
    price();
  }
  function total_price_down()
  {
    quantity--;
    if(quantity<=0)
    {
      quantity=0;
    }
    price();
  }
  function price()
  {
    $('#quantity').val(quantity)
    var final_price = Math.round($('#price').val()*$('#quantity').val()*100)/100
    $('.total_price').val(final_price)
  }
});
