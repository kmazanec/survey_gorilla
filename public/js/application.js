$(document).ready(function() {

  $("#signup_toggle").on("click", function(event){
    event.preventDefault();
    var options = {};
    $("#signin_area").slideUp(200);
    $("#signup_area").slideDown(201);

  })

  $("#signin_toggle").on("click", function(event){
    event.preventDefault();
    $("#signin_area").slideDown(201);
    $("#signup_area").slideUp(200);

  })

});
