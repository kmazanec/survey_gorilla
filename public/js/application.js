function displayNextQuestion(current_question){
    current_question.hide();
    current_question.next().addClass('current_question');
    current_question.removeClass('current_question');
    current_question.next().show();
}

function displaySubmitButton(){
  $('#survey_next').hide();
  $('#survey_submit_button').show();
}

function checkQuestionComplete(){
  var any_selected = false;

  $(".current_question input").each(function(index, val) {
     console.log( val );
     if ($(val).is(":checked")) {
      any_selected = true;
     }
  });
  return any_selected;
}


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


  $("#survey_next").on("submit", function(event){
    event.preventDefault();
    var current_question = $(".current_question");
    if (checkQuestionComplete()) {
      $("#incomplete_question_alert").hide();

      if (current_question.next().next().hasClass('end_of_questions')) {
        displaySubmitButton();
        displayNextQuestion(current_question);
      } else {
        displayNextQuestion(current_question);
      }
    }
    else {
      $("#incomplete_question_alert").show();
    }
  })

  $("survey").on("submit", function(event){
    event.preventDefault();



  })





});
