Template.student.helpers({
  "updateDurationStudentExercice": function(current) {
    console.log("start", current);
    console.log("test time ",current.time);
    // if(current.time == undefined){
    //   console.log("im undefined");
    // }
    function timerDurationStudentExercice(){
      if(current.isCurrent && current.time == undefined){
        $('#time').html( Date.now() - current.start );
      }
      else{
        $('#time').html(current.time);
      }
    }
    
    Meteor.setInterval(timerDurationStudentExercice,0.1);

  }
});
