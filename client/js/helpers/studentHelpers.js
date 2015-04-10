Template.student.helpers({

  "updateDurationStudentExercice": function(current) {
    var exist = false;
    console.log("CURRENT ",current);
    console.log($('#time'+current.exercice_id).attr("class"));
    function timerDurationStudentExercice(){
      if(!current.time){
        console.log("time n existe pas");
      }
      else{
        exist = true;
        // console.log("time existe");
      }
      if(exist){
        // console.log(exist);
        $('#time'+current.exercice_id).html(current.time);
        // $('#time'+current.exercice_id).attr("class") = "disabled";        
      }
      else{
        // if($('#time-'+current.exercice_id).attr('class') == "enabled"){
        //   $('#time-'+current.exercice_id).html( Date.now() - current.start );
        // }
        
      }
    }
    
    var interval = Meteor.setInterval(timerDurationStudentExercice,2000);
    interval = null;
  }
});
