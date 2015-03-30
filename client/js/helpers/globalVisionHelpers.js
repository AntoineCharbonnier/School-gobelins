var numberValidatedStudents = 0;
Template.globalVision.helpers({
  // numberValidatedStudents = 0;
  "getStudentNumber": function() {
      return Meteor.users.find({
        "profile.connected": true
      }).fetch().length;
  },
  "getNumberStudentValidExercice": function(the_exercice_id) {
    var users = Meteor.users.find({
      "profile.connected": true
    }).fetch();
    console.log("USERS",users[0]);
    
    for (var i = 0; i < users.length; i++) {
      var current = users[i];
      console.log("profile",current.profile.answers);
      
      for(var j = 0; j < current.profile.answers.length; j++){
        if (current.profile.answers[j].exercice_id == the_exercice_id){

          console.log("isvalid : ",current.profile.answers[j].validated);
          
          if(current.profile.answers[j].validated){
            console.log("VALIDATED");
            numberValidatedStudents ++;
          }          
        }
      } 
    }
    return numberValidatedStudents;
  }
});
