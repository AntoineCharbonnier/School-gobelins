Template.globalVision.helpers({
  "getStudentNumber": function() {
      return Meteor.users.find({
        "profile.connected": true
      }).fetch().length;
  },
  "getNumberStudentValidExercice": function(the_exercice_id) {
    var users = Meteor.users.find({
      "profile.connected": true
    }).fetch();
    var numberValidatedStudents = 0;
    for (var i = 0; i < users.length; i++) {
      var current = users[i];
      for(var j = 0; j < current.profile.answers.length; j++){
        if (current.profile.answers[j].exercice_id == the_exercice_id){
          if(current.profile.answers[j].validated){
            numberValidatedStudents ++;
          }          
        }
      } 
    }
    return numberValidatedStudents;
  },
  
  "getAttemptsExercice": function(the_exercice_id) {
    var users = Meteor.users.find({
      "profile.connected": true
    }).fetch();
    var attempsAverrage = 0;
    for (var i = 0; i < users.length; i++) {
      var current = users[i];
      for(var j = 0; j < current.profile.answers.length; j++){
        if (current.profile.answers[j].exercice_id == the_exercice_id){
          if(current.profile.answers[j].attempt){
            attempsAverrage += current.profile.answers[j].attempt;
          }          
        }
      } 
    }
    return attempsAverrage;
  },

  "getDurationExercice": function(the_exercice_id, booleanString) {
    var users = Meteor.users.find({
      "profile.connected": true
    }).fetch();
    var timeAverrage = 0;
    for (var i = 0; i < users.length; i++) {
      var current = users[i];
      console.log("first loop");
      for(var j = 0; j < current.profile.answers.length; j++){
        console.log("second loop");
        if (current.profile.answers[j].exercice_id == the_exercice_id){
          if(current.profile.answers[j].time){
            timeAverrage += current.profile.answers[j].time;
            console.log("MY TIME : ",timeAverrage);
          }          
        }
      } 
    }
    if(booleanString){
      var minutes = Math.floor(timeAverrage / 60000);
      var seconds = ((timeAverrage % 60000) / 1000).toFixed(0);
      console.log(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
      if(minutes < 10){
        minutes = "0"+minutes;
      }
      return minutes + ":" + (seconds < 10 ? '0' : '') + seconds
    }
    else{
      return timeAverrage;
    }
  },

  "getTotalDurationExercice": function(booleanString) {
    var users = Meteor.users.find({
      "profile.connected": true
    }).fetch();

    var exercices = Exercices.find().fetch();

    var timeAverrage = 0;
    for (var i = 0; i < users.length; i++) {
      var current = users[i];
      for(var j = 0; j < current.profile.answers.length; j++){
        for(var k = 0; k < exercices.length; k++){
          if (current.profile.answers[j].exercice_id == exercices[k]._id){
            if(current.profile.answers[j].time){
              timeAverrage += current.profile.answers[j].time;
            }          
          }
        }
        
      } 
    }
    if(booleanString){
      var minutes = Math.floor(timeAverrage / 60000);
      var seconds = ((timeAverrage % 60000) / 1000).toFixed(0);
      console.log(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
      if(minutes < 10){
        minutes = "0"+minutes;
      }
      return minutes + ":" + (seconds < 10 ? '0' : '') + seconds
    }
    else{
      return timeAverrage;
    }
  },

  "getNumberHelpExercice": function(the_exercice_id) {
    var users = Meteor.users.find({
      "profile.connected": true
    }).fetch();
    var numberHelp = 0;
    for (var i = 0; i < users.length; i++) {
      var current = users[i];
      for(var j = 0; j < current.profile.answers.length; j++){
        if (current.profile.answers[j].exercice_id == the_exercice_id){
          if(current.profile.answers[j].needHelp){
            numberHelp += 1;
            console.log("HELPS  : ",numberHelp);
          }          
        }
      } 
    }
    return numberHelp;
  },  

  "isStudentNeedHelp": function(student) {
    var i;
    i = 0;
    var image_name = student.username.replace(/\s/g,"_");
    var avatar = $ ("#avatar-"+image_name);
    console.log("YOY");
    while (i < student.profile.answers.length){
      if(student.profile.answers[i].needHelp){
        // ANIMATION 
        var t, tm;
        t = 0;
        tm = new TimelineMax({paused: true,repeat: -1, yoyo: true, repeatDelay: 3.0});
        tm.to(avatar, 0.1, {x: 10,ease: Ease.easeIn}, t+= 0.1);
        tm.to(avatar, 0.1, {x: -10,ease: Ease.easeIn}, t+= 0.1);
        tm.to(avatar, 0.1, {x: 10,ease: Ease.easeIn}, t+= 0.1);
        tm.to(avatar, 0.1, {x: -10,ease: Ease.easeIn}, t+= 0.1);
        tm.to(avatar, 0.1, {x: 10,ease: Ease.easeIn}, t+= 0.1);
        tm.to(avatar, 0.1, {x: -10,ease: Ease.easeIn}, t+= 0.1);
        tm.to(avatar, 0.1, {x: 10,ease: Ease.easeIn}, t+= 0.1);
        tm.to(avatar, 0.1, {x: -10,ease: Ease.easeIn}, t+= 0.1);
        tm.to(avatar, 0.1, {x: 10,ease: Ease.easeIn}, t+= 0.1);
        tm.to(avatar, 0.1, {x: -10,ease: Ease.easeIn}, t+= 0.1);
        tm.to(avatar, 0.1, {x: 10,ease: Ease.easeIn}, t+= 0.1);
        tm.to(avatar, 0.1, {x: 0,ease: Ease.easeIn}, t+= 0.1);
        tm.play();
        
        // var newAnswers = [];
        // var currentAnswers = student.profile.answers[i];
        // currentAnswers.needHelp = false;

        // newAnswers.push( currentAnswers );

        // Meteor.users.update({
        //   _id : student._id
        // }, {
        //   $set: {
        //     "profile.answers": newAnswers
        //   }
        // }) 
      }
      i++;
    }
  },

  "getNameWithUnderscore": function(student_Name) {
    var image_name;
    image_name = student_Name.replace(/\s/g, "_");
    console.log(image_name);
    return image_name;
  }
});
