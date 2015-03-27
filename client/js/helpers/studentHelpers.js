Template.student.helpers({
  "updateDurationStudentExercice": function(current) {
    console.log("start", current);
    if(current.isCurrent && !current.validated){
      Meteor.setInterval(function(){
        $('#time').html( Date.now() - current.start );
      },0.1);
    }
  }
});
