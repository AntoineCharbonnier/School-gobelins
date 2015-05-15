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
    var image_name = student.username.replace(/\s/g,"_");
    var avatar = $ ("#avatar-"+image_name);
    var currentEx = 0;
    var t, tm;
    tm = new TimelineMax({paused: true,repeat: 3, yoyo: false, repeatDelay: 3.0});
    for(var i = 0; i < student.profile.answers.length; i++){
      if(currentEx < student.profile.answers[i].currentEx){
        currentEx = student.profile.answers[i].currentEx;
        
      }
    }
    console.log("currentEx h",currentEx);
    for(var l = 0; l < student.profile.answers.length; l ++){
      if(currentEx == student.profile.answers[l].currentEx){
        console.log("here");
        if(student.profile.answers[l].needHelp){
          // ANIMATION 
          console.log("needHelp");
          t = 0;
          //ADD MARGIN FOR NO MOVE
          
          tm.to(avatar, 0.1, {transformOrigin:"50% 50%",scale: 0.5,ease: Ease.easeIn}, t+= 0.1);
          tm.to(avatar, 0.1, {transformOrigin:"50% 50%",scale: 0.8,ease: Ease.easeIn}, t+= 0.1);
          tm.to(avatar, 0.1, {transformOrigin:"50% 50%",scale: 0.5,ease: Ease.easeIn}, t+= 0.1);
          tm.to(avatar, 0.1, {transformOrigin:"50% 50%",scale: 0.8,ease: Ease.easeIn}, t+= 0.1);
          tm.to(avatar, 0.1, {transformOrigin:"50% 50%",scale: 0.5,ease: Ease.easeIn}, t+= 0.1);
          tm.to(avatar, 0.1, {transformOrigin:"50% 50%",scale: 0.8,ease: Ease.easeIn}, t+= 0.1);
          tm.to(avatar, 0.1, {transformOrigin:"50% 50%",scale: 0.5,ease: Ease.easeIn}, t+= 0.1);
          tm.to(avatar, 0.1, {transformOrigin:"50% 50%",scale: 0.8,ease: Ease.easeIn}, t+= 0.1);
          tm.to(avatar, 0.1, {transformOrigin:"50% 50%",scale: 0.5,ease: Ease.easeIn}, t+= 0.1);
          tm.to(avatar, 0.1, {transformOrigin:"50% 50%",scale: 0.8,ease: Ease.easeIn}, t+= 0.1);
          tm.to(avatar, 0.1, {transformOrigin:"50% 50%",scale: 0.5,ease: Ease.easeIn}, t+= 0.1);
          tm.to(avatar, 0.1, {transformOrigin:"50% 50%",scale: 1,ease: Ease.easeIn}, t+= 0.1);
          tm.play();
          
          // only for test
          var newAnswers = [];
          var currentAnswers = student.profile.answers[l];
          currentAnswers.needHelp = false;

          newAnswers.push( currentAnswers );

          Meteor.users.update({
            _id : student._id
          }, {
            $set: {
              "profile.answers": newAnswers
            }
          }) 
        }
        else{
          tm = null;
        }
      }
    }

    // while (i < student.profile.answers.length){

      // i++;
    // }
  },

  "getNameWithUnderscore": function(student_Name) {
    var image_name;
    image_name = student_Name.replace(/\s/g, "_");
    return image_name;
  },

  "updateStudentSwitchProgress": function(){
    var users = Meteor.users.find({
    "profile.account": "student"
    }, {sort: { username: 1} }).fetch();

    // var users = Meteor.users.find({
    //   "profile.account": "student"
    // }).fetch();
    console.log("nb user : ",users.length);
    for(var j = 0; j < parseInt(users.length); j++){
      var student = users[j];
      if(student){
        // console.log(users[j]);
        var student_image_name;
        student_image_name = student.username.replace(/\s/g, "_");
        var avatar = $("#avatar-"+student_image_name);
        var currentEx = 0;
        // currentEx = student.profile.currentExercice;
       
        t = 0;
        timeline = new TimelineMax({paused: true});


        var scaleValue = 1;
        var opacity = 1;
        
        for(var i = 0; i < student.profile.answers.length; i++){
          if(currentEx < student.profile.answers[i].currentEx){
            currentEx = student.profile.answers[i].currentEx;
          }
        }
        for(var l = 0; l < student.profile.answers.length; l ++){
          if(currentEx == student.profile.answers[l].currentEx){
            console.log("attempt ",student.profile.answers[l].attempt);
            scaleValue = scaleValue + 0.05 * student.profile.answers[l].attempt;
          }
        }
        console.log("Exercice courant : ",currentEx);

        if(currentEx == 0){
          //bug 
        }
        else{
          if(currentEx < 3 ){
            opacity = 1;
          }
          if(3 <= currentEx < 6 ){
            scaleValue = scaleValue - 0.3;
            opacity = 0.5;
          }
          if(6 <= currentEx ){
            scaleValue = scaleValue - 0.6;
            opacity = 0.25;
          }
        }
        // Meteor.users.update({
        //   _id : student._id
        // }, {
        //   $set: {
        //     "profile.scale": scaleValue
        //   }
        // })
        timeline.to(avatar, 1, {scale: scaleValue, autoAlpha: opacity, ease: Ease.easeIn}, t+= 0.1);
        timeline.play();
        
      }

    }
  }
});
