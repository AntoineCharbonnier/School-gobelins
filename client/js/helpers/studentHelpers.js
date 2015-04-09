Template.student.helpers({
  "updateDurationStudentExercice": function(current) {
    console.log("CURRENT ",current);
    function timerDurationStudentExercice(){
      // console.log(current.time == undefined);
      // if(current.isCurrent && current.time == undefined && !current.validated){
      //   $('#time-'+current.exercice_id).html( Date.now() - current.start );
      // }
      // else{
      //   $('#time'+current.exercice_id).html(current.time);
        
      // }
      // if(!(current.time == undefined) || current.time){
      //   console.log("EXIST");
      //   Meteor.clearInterval(interval);
      // }
      if(current.time){
        console.log("time  existe ");
        $('#time-'+current.exercice_id).removeClass("is-not-defined")
      }

      if($('#time-'+current.exercice_id).hasClass("is-not-defined")){
        $('#time-'+current.exercice_id).html( Date.now() - current.start );
      }
      else{
        $('#time'+current.exercice_id).html(current.time);
      }
    }
    
    var interval = Meteor.setInterval(timerDurationStudentExercice,0.1);
    // if(!(current.time == undefined) || current.time){
    //   console.log("EXIST");
    //   Meteor.clearInterval(interval);
    // }
  }
});
