Template.exercice.events({
  "click #validator": function(e) {
    var selectValue = $("#answer").val();    
    var student = Template.currentData().student;
    var question = Template.currentData().exercice;

    var newAnswers = [];

    for (var i = 0; i < student.profile.answers.length; i++) {
      var current = student.profile.answers[i];
      if (current.exercice_id == question._id){
        current.answer = selectValue;
        current.attempt += 1;
        console.log(current.answer," ET ",question.answers.right);
        if(current.answer == question.answers.right || parseInt(current.answer) == question.answers.right){
          console.log("GOOOD");
          var currentTime = Date.now();
          current.time = currentTime - current.start;
          current.isCurrent = false;
          current.validated = true;

          $('#next').removeClass("hide");
        }
      }
      newAnswers.push( current );
    }
    console.log("ANSWERS : ",newAnswers);
    
    Meteor.users.update({
      _id : student._id
    }, {
      $set: {
        "profile.answers": newAnswers
      }
    })
  },
  
  "keyup #comment": function(e) {
    var selectValue = e.target.value;    
    var student = Template.currentData().student;
    var question = Template.currentData().exercice;

    var newAnswers = [];

    for (var i = 0; i < student.profile.answers.length; i++) {
      var current = student.profile.answers[i];
      if (current.exercice_id == question._id){
        current.comment = selectValue;
      }
      newAnswers.push( current );
    }

    Meteor.users.update({
      _id : student._id
    }, {
      $set: {
        "profile.answers": newAnswers
      }
    })
  },
  
  "submit form": function(e) {
    e.preventDefault();
    // bloque la reactualisation
    return false;
  }
});