Template.exercice.events({
  "click #next": function(e) {
    $('#next').addClass("hide");
  },

  "click #validator": function(e) {
    var selectValue = $("#answer").val();    
    var student = Template.currentData().student;
    var question = Template.currentData().exercice;

    var newAnswers = [];

    for (var i = 0; i < student.profile.answers.length; i++) {
      var current = student.profile.answers[i];
      console.log("current: :",current);
      if (current.exercice_id == question._id){
        current.answer = selectValue;
        current.attempt += 1;
        current.isCurrent = true;
        current.currentEx = question.number;
        if(current.answer == question.answers.right || parseInt(current.answer) == question.answers.right){
          var currentTime = Date.now();
          current.time = currentTime - current.start;
          current.isCurrent = false;
          current.validated = true;
          current.needHelp = false;
          // current.answer[i].isCurrent = false;

          $('#next').removeClass("hide");
        }
        else{
          $("#answer").val("0");
          var question = $(".question");
          var answerInput = $("#answer");
          var t, tm;
          t = 0;
          //BUG IN PLACEHOLDER
          tm = new TimelineMax({paused: true});
          tm.to(question, 0.1, {x: -5,ease: Ease.easeIn}, t+= 0.1);
          tm.to(answerInput,0.1,{x: -5,ease: Ease.easeIn},t );
          
          tm.to(question, 0.1, {x: 5,ease: Ease.easeIn}, t+= 0.1);
          tm.to(answerInput,0.1,{x: 5,ease: Ease.easeIn},t );
          
          tm.to(question, 0.1, {x: -5,ease: Ease.easeIn}, t+= 0.1);
          tm.to(answerInput,0.1,{x: -5,ease: Ease.easeIn},t );
          
          tm.to(question, 0.1, {x: 5,ease: Ease.easeIn}, t+= 0.1);
          tm.to(answerInput,0.1,{x: 5,ease: Ease.easeIn},t );
          
          tm.to(question, 0.1, {x: 0,ease: Ease.easeIn}, t+= 0.1);
          tm.to(answerInput,0.1,{x: 0,ease: Ease.easeIn},t );
          tm.play();
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

  "click #validator-medium-level": function(e) {
    console.log("MEDIUM WAY");
    var endResult = $("#answer").val(); 
    var susbstractionIntermediate = $("#intermediate-substraction-medium-level").val(); 
    var susbstractionRest = $("#intermediate-substraction-result-medium-level").val();


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
          // current.attempt += 1;
        }

        if(question.dividend - (question.dividend % question.denominator) == susbstractionIntermediate  || parseInt(question.dividend - (question.dividend % question.denominator)) == susbstractionIntermediate){
          findSubstraction = true;
          console.log("findSub");
        }
        else{
          // current.attempt += 1;
        }

        if(current.answer == question.answers.right || parseInt(current.answer) == question.answers.right){
          findResult = true;
          console.log("findResult");
        }
        else{
          // current.attempt += 1;
        }
        current.attempt += 1;

        if(findResult && findRest && findSubstraction){
          console.log("GOD ANSWERS");
          var currentTime = Date.now();
          current.time = currentTime - current.start;
          current.isCurrent = false;
          current.validated = true;
          current.needHelp = false;
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
  },


"keyup #first-intermediate-substraction-result-hard-level": function(e) {
    var selectValue = e.target.value; 
    var question = Template.currentData().exercice; 
    console.log(selectValue);   
    $("#first-intermediate-substraction-result-hard-level").attr("data-first-intermediate-substraction-result",selectValue);
    var data = parseInt($("#first-intermediate-substraction-result-hard-level").attr("data-first-intermediate-substraction-result"));
    if(!isNaN(data)){
      var valueToDivide = (data * 10 + ( parseInt(question.dividend) % 10 ));
      $(".second-substraction-number").html("Soit "+valueToDivide+ " diviser par "+ question.denominator + "<br>" +valueToDivide );
    }
  },

  "click #validator-hard-level": function(e) {
    console.log("HARD WAY");
    var student = Template.currentData().student;
    var question = Template.currentData().exercice;
    
    var endResult = $("#answer").val(); 
    var firstSubstraction = $("#first-intermediate-substraction-hard-level").val(); 
    var firstSubstractionRest = $("#first-intermediate-substraction-result-hard-level").val();
    
    var secondSubstraction = $("#second-intermediate-substraction-hard-level").val(); 
    var secondSubstractionRest = $("#second-intermediate-substraction-result-hard-level").val();

    console.log("TRUC : ",question.dividend % question.denominator, " firstSubstractionRest : ",firstSubstractionRest);


    var firstFindRest = false;
    var firstFindSubstraction = false;
    var firstFindResult = false;

    var secondFindRest = false;
    var secondFindSubstraction = false;
    var secondFindResult = false;

    var firstStepValid = false;
    var secondStepValid = false;



    var newAnswers = [];

    for (var i = 0; i < student.profile.answers.length; i++) {
      var current = student.profile.answers[i];
      if (current.exercice_id == question._id){
        current.answer = endResult;
        // current.attempt += 1;
        if(parseInt(question.dividend/10) % question.denominator == firstSubstractionRest || parseInt(question.dividend/10 % question.denominator) == firstSubstractionRest ){
          firstFindRest = true
          console.log("firstFindRest");
        }
        else{
          current.attempt += 1;
        }

        if(question.dividend/10 - (question.dividend/10 % question.denominator) == firstSubstraction  || parseInt(question.dividend/10 - (question.dividend/10% question.denominator)) == firstSubstraction){
          firstFindSubstraction = true;
          console.log("findSub");
        }
        else{
          current.attempt += 1;
        }
        

        // if(current.answer == question.answers.right || parseInt(current.answer) == question.answers.right){
        //   firstFindResult = true;
        //   console.log("firstFindResult");
        // }
        // else{
        //   current.attempt += 1;
        // }


        if(firstFindRest && firstFindSubstraction){
          // console.log("GOD ANSWERS");
          // var currentTime = Date.now();
          // current.time = currentTime - current.start;
          // current.isCurrent = false;
          // current.validated = true;

          // $('#next').removeClass("hide");
          firstStepValid = true;
          console.log("first step valid");
        }
  
        var data = parseInt($("#first-intermediate-substraction-result-hard-level").attr("data-first-intermediate-substraction-result"));
        console.log("DATA : ",data);
        
        if(!isNaN(data)){
          var valueToDivide = (data * 10 + ( parseInt(question.dividend) % 10 ));
          console.log("valueToDivide", valueToDivide);
          if(parseInt(valueToDivide) % question.denominator == secondSubstractionRest || parseInt(valueToDivide % question.denominator) == secondSubstractionRest ){
            secondFindRest = true
            console.log("secondFindRest");
          }
          else{
            current.attempt += 1;
          }

          if(valueToDivide - (valueToDivide % question.denominator) == secondSubstraction  || parseInt(valueToDivide - (valueToDivide% question.denominator)) == secondSubstraction){
            secondFindSubstraction = true;
            console.log("secondfindSub");
          }
          else{
            current.attempt += 1;
          }

          if(secondFindRest && secondFindSubstraction){
            secondStepValid = true;
            console.log("second step valid"); 
          }
          if(firstStepValid && secondStepValid){
            console.log("GOD ANSWERS");
            var currentTime = Date.now();
            current.time = currentTime - current.start;
            current.isCurrent = false;
            current.validated = true;
            current.needHelp = false;
            $('#next').removeClass("hide");
          }
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
  }
});