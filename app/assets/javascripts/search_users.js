jQuery(document).ready(function($) {
  $('#search_user').keyup(function() {
    $.ajax({
      type: 'GET',
      url: '/searchuser',
      data: {name: $('#search_user').val()},
      dataType: 'json',
      success: function(data){
        // $('tbody tr').remove()
        var string='';
        for(i=0;i<data.length;i++)
        {
          if(data[i].admin==true)
          {
            string+='<tr><td>'+data[i].id+'</td><td>'+data[i].email+'</td><td>'+data[i].name+'</td><td>'+data[i].phone+'</td><td>'+data[i].address+'</td><td></td><tr>';
          }
          else
          {
            string+='<tr><td>'+data[i].id+'</td><td>'+data[i].email+'</td><td>'+data[i].name+'</td><td>'+data[i].phone+'</td><td>'+data[i].address+'</td><td><a data-confirm="<span class=&quot;translation_missing&quot; title=&quot;translation missing: en.users.users_list.sure&quot;>Sure</span>" class="btn btn-danger" rel="nofollow" data-method="delete" href="/users/'+data[i].id+'"><span class="glyphicon glyphicon-remove"></span></a></td><tr>';
          }
          $('tbody').html(string)
        }
      }
    });
  });
});
