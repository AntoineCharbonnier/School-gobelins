Template.student.helpers({
  "updateDurationStudentExercice": function(current) {
    console.log("start", current);
    console.log("test time ",current.time);
    if(current.time == undefined){
      console.log("im undefined");
    }
    function timerDurationStudentExercice(){
      if(current.isCurrent && current.time == undefined){
        $('#time-'+current.exercice_id).html( Date.now() - current.start );
      }
      else{
        $('#time'+current.exercice_id).html(current.time);
      }
    }
    
    Meteor.setInterval(timerDurationStudentExercice,0.1);

  }
});
