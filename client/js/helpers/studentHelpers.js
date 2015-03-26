Template.student.helpers({
  "updateDurationStudentExercice": function(current) {
    console.log("start", current);
    if(current.isCurrent){
      // var student  = Template.currentData().student;
      // var question = Template.currentData().exercice;
      Meteor.setInterval(function(){

        $('#time').html( Date.now() - current.start );
        // var newAnswers = [];

        // for (var i = 0; i < student.profile.answers.length; i++) {
        //   var current = student.profile.answers[i];
        //   if (current.exercice_id == question._id){
        //     current.answer = selectValue;
        //     current.attempt += 1;
        //     if(current.answer == question.answers.right){
        //       var currentTime = Date.now();
        //       current.time = currentTime - current.start;
        //       $('')
        //     }
        //   }

        // }

        // Meteor.users.update({
        //   _id : student._id
        // }, {
        //   $set: {
        //     "profile.answers": newAnswers
        //   }
        // }) 
      },0.1);
    }
  }
});