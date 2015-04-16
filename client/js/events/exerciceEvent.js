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
        if(current.answer == question.answers.right || parseInt(current.answer) == question.answers.right){
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

  "click #validator-assisted": function(e) {
    var endResult = $("#answer").val(); 
    var susbstractionIntermediate = $("#intermediate-substraction").val(); 
    var susbstractionRest = $("#intermediate-substraction-result").val();


    var findRest = false;
    var findSubstraction = false;
    var findResult = false;

    var student = Template.currentData().student;
    var question = Template.currentData().exercice;

    var newAnswers = [];

    for (var i = 0; i < student.profile.answers.length; i++) {
      var current = student.profile.answers[i];
      if (current.exercice_id == question._id){
        current.answer = endResult;
        // current.attempt += 1;
        if(question.dividend % question.denominator == susbstractionRest || parseInt(question.dividend % question.denominator) == susbstractionRest ){
          findRest = true
          console.log("findRest");
        }
        else{
          current.attempt += 1;
        }

        if(question.dividend - (question.dividend % question.denominator) == susbstractionIntermediate  || parseInt(question.dividend - (question.dividend % question.denominator)) == susbstractionIntermediate){
          findSubstraction = true;
          console.log("findSub");
        }
        else{
          current.attempt += 1;
        }

        if(current.answer == question.answers.right || parseInt(current.answer) == question.answers.right){
          findResult = true;
          console.log("findResult");
        }
        else{
          current.attempt += 1;
        }


        if(findResult && findRest && findSubstraction){
          console.log("GOD ANSWERS");
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
  },

  "click #need-help": function(e) {
    var student = Template.currentData().student;
    var question = Template.currentData().exercice;

    var newAnswers = [];

    for (var i = 0; i < student.profile.answers.length; i++) {
      var current = student.profile.answers[i];
      if (current.exercice_id == question._id){
        current.needHelp = true;
      }
      newAnswers.push( current );
    }
    console.log("ANSWERS HELP : ",newAnswers);
    
    Meteor.users.update({
      _id : student._id
    }, {
      $set: {
        "profile.answers": newAnswers
      }
    })    
  }
});