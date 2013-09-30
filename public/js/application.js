if (!Array.prototype.last){
    Array.prototype.last = function(){
        return this[this.length - 1];
    };
};

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

function Survey(){
  this.questions = [];
  this.name = "Untitled Survey";
  var temp_question = new Question(1);
  this.questions.push(temp_question);
}

Survey.prototype.add_question = function(){
  var temp_question = new Question(this.questions.length + 1);
  this.questions.push(temp_question);
};


function Question(id){
  this.id = id;
  this.options = [];
  var temp_option1 = new Option(1);
  var temp_option2 = new Option(2);
  this.options.push(temp_option1);
  this.options.push(temp_option2);
}

Question.prototype.add_option = function() {
  var new_option = new Option(this.options.length + 1);
  this.options.push(new_option);
};

function Option(id){
  this.id = id;
}

function generateQuestion(){
  new_q_id = my_survey.questions.last().id;
  return "<div class='new_question'><input type='text' name='questions["+new_q_id+"]' placeholder='Question?'><br><input type='text' name='options["+new_q_id+"][1]' placeholder='Option 1'><br><input type='text' name='options["+new_q_id+"][2]' placeholder='Option 2'><br></div>"
}

function generateOption(question_id){
  var new_option_id = my_survey.questions[question_id-1].options.last().id;
  return "<input type='text' name='options["+question_id+"]["+new_option_id+"]' placeholder='Option "+new_option_id+"'><br>"
}


// ============= DOCUMENT READY ================================= //

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

    if ( checkQuestionComplete() ) {
      $("#incomplete_question_alert").hide();
    } else {
      $("#incomplete_question_alert").show();
      return false;
    }

    var current_question = $(".current_question");
    if (current_question.next().next().next().hasClass('end_of_questions')) {
      displaySubmitButton();
      displayNextQuestion(current_question);
    } else {
      displayNextQuestion(current_question);
    }
  })

  $("#survey").on("submit", function(event){
    event.preventDefault();
    if ( checkQuestionComplete() ) {
      $("#incomplete_question_alert").hide();
    } else {
      $("#incomplete_question_alert").show();
      return false;
    }

    var formdata = $('#survey').serialize();
    var url = $("#survey").attr("action");

    $.post(url, formdata, function(response){
      console.log(response);
      // NEED TO MAKE THE PAGE GO TO THE RIGHT PLACE
      // DOES NOTHING RIGHT NOW
    });
  })


  my_survey = new Survey();

  $("#new_survey").on("submit", function(event){
    event.preventDefault();

  })

  $("#add_question").on("click", function(event){
    event.preventDefault();
    my_survey.add_question();
    $("#add_option").before(generateQuestion(my_survey.questions.last().id));
  })

  $("#add_option").on("click", function(event){
    event.preventDefault();
    my_survey.questions.last().add_option();
    $(this).before(generateOption(my_survey.questions.last().id));
  })

  $("#survey_name").blur(function(event){
    my_survey.name = this.value;
    $("#new_survey_name").text(my_survey.name);
  })


  





});
