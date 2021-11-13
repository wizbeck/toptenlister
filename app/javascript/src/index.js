jQuery(function() {
  console.log('I will see this in console if it works');
  $('.nav-link').on('click', function() {
    $( this ).toggleClass('active');
  });
})
