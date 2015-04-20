Template.student.helpers({
  "updateDurationStudentExercice": function(current) {
    console.log("CURRENT ",current);
    function timerDurationStudentExercice(){
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
  },

  "getNeedHelp": function(student) {
    console.log("THIS", student);
    if(this.needHelp){
      return "OUI";
    }
    else{
      return "NON";
    }
  }
});