jQuery(document).ready(function($) {
$('input[name="daterange"]').daterangepicker({
  ranges: {
   'Last 7 Days': [moment().subtract(6, 'days'), moment()],
   'Last 30 Days': [moment().subtract(29, 'days'), moment()],
   'This Month': [moment().startOf('month'), moment().endOf('month')],
   'Last Month': [moment().subtract(1, 'month').startOf('month'),
      moment().subtract(1, 'month').endOf('month')]
  },
  locale:{
    format: 'YYYY/MM/DD'
  }
});
});
