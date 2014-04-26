
// Quick Table Search
$('#search').keyup(function() {
  var regex = new RegExp($('#search').val(), "i");
  var rows = $('table tr:gt(0)');
  debugger;
  rows.each(function (index) {
    email = $(this).children("#email").html()
    firstName = $(this).children("#first_name").html()
    lastName = $(this).children("#last_name").html()
    phone= $(this).children("#phone").html()
    if ((email.search(regex) != -1 )|| (firstName.search(regex) != -1) || (lastName.search(regex) != -1 )|| (phone.search(regex) != -1)){
      $(this).show();
    } else {
      $(this).hide();
    }
  });
});

$('#searchContacts').keyup(function() {
  var regex = new RegExp($('#searchContacts').val(), "i");
  var rows = $('form label:gt(4)');
  rows.each(function (index) {
    email =  $(this).text();
    if (email.search(regex) != -1 ){
      $(this).show();
    } else {
      $(this).hide();
    }
  });
});
