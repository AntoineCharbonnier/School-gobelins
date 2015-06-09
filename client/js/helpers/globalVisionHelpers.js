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
      for(var j = 0; j < current.profile.answers.length; j++){
        if (current.profile.answers[j].exercice_id == the_exercice_id){
          if(current.profile.answers[j].time){
            timeAverrage += current.profile.answers[j].time;
          }          
        }
      } 
    }
    if(booleanString){
      var minutes = Math.floor(timeAverrage / 60000);
      var seconds = ((timeAverrage % 60000) / 1000).toFixed(0);
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
    var users        = Meteor.users.find({
    "profile.connected": true
    }).fetch();
    var exercices    = Exercices.find().fetch();
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
      if(minutes < 10){
        minutes = "0"+minutes;
      }
      var theText = ""+ minutes + ":" + (seconds < 10 ? '0' : '') + seconds+""
      t = 1
      tm = new TimelineMax({paused: true});
      tm.to($("#time"), 3,{autoAlpha: 1, scrambleText:{text:theText, chars:"0123456789", revealDelay:0.5, tweenLength:false, ease:Linear.easeNone}},t+=.3);
      tm.play()
    }
    else{
      var theText = timeAverrage
      t = 1
      tm = new TimelineMax({paused: true});
      tm.to($("#time"), 3,{autoAlpha: 1, scrambleText:{text:theText, chars:"0123456789", revealDelay:0.5, tweenLength:false, ease:Linear.easeNone}},t+=.3);
      tm.play()
    }
  },

  "getNumberHelpExercice": function(the_exercice_id) {
    var users      = Meteor.users.find({
    "profile.connected": true
    }).fetch();
    var numberHelp = 0;
    for (var i = 0; i < users.length; i++) {
      var current = users[i];
      for(var j = 0; j < current.profile.answers.length; j++){
        if (current.profile.answers[j].exercice_id == the_exercice_id){
          if(current.profile.answers[j].needHelp){
            numberHelp += 1;
          }          
        }
      } 
    }
    return numberHelp;
  },  

  "isStudentNeedHelp": function(student) {
    var image_name = student.username.replace(/\s/g,"_");
    var avatar     = $ ("#avatar-"+image_name);
    var currentEx  = 0;
    var t, tm;

    tm = new TimelineMax({paused: true,repeat: 3, yoyo: false, repeatDelay: 3.0});
    for(var i = 0; i < student.profile.answers.length; i++){
      if(currentEx < student.profile.answers[i].currentEx){
        currentEx = student.profile.answers[i].currentEx;
      }
    }
    for(var l = 0; l < student.profile.answers.length; l ++){
      if(currentEx == student.profile.answers[l].currentEx){
        if(student.profile.answers[l].needHelp){
          console.log("need help");
          console.log("IS STUDENT NEED HELP : ",image_name);
          t = 0;
          for(var index = 0; index < 65; index++){

            tm.to($("#"+student._id+"_help_anim_"+index), 0.015, {autoAlpha:1, ease: Ease.easeIn}, t+= 0.015);
            tm.to($("#"+student._id+"_help_anim_"+index), 0.015, {autoAlpha:0, ease: Ease.easeIn}, t+= 0.015);
          }
          tm.play();
          
          // only for test
          // var newAnswers = [];
          // var currentAnswers = student.profile.answers[l];
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
        else{
          tm = null;
        }
      }
    }
  },

  "getNameWithUnderscore": function(student_Name) {
    var image_name;
    image_name = student_Name.replace(/\s/g, "_");
    return image_name;
  },

  "updateStudentSwitchProgress": function(){
    var realUsers = Meteor.users.find({
    "profile.account": "student",
    "username": {"$in": ["Abla Louna", "Begidis Alban", "Bihannic Etienne"]}
    }).fetch();

    console.log("THE MULTIPLE USERS : ",realUsers);

    for(var j = 0; j < parseInt(realUsers.length); j++){
      var student = realUsers[j];
      if(student){
        var student_image_name;
        student_image_name = student.username.replace(/\s/g, "_");
        var avatar         = $("#avatar-"+student_image_name);
        var currentEx      = 0;       
        t                  = 0;
        timeline           = new TimelineMax({paused: true});
        var scaleValue     = 1;
        var opacity        = 1;
        
        for(var i = 0; i < student.profile.answers.length; i++){
          if(currentEx < student.profile.answers[i].currentEx){
            currentEx = student.profile.answers[i].currentEx;
          }
        }
        for(var l = 0; l < student.profile.answers.length; l ++){
          if(currentEx == student.profile.answers[l].currentEx){
            // scaleValue = scaleValue + 0.05 * student.profile.answers[l].attempt;
            if(currentEx < 3 ){
              scaleValue =  0.8;
            }
            if(3 <= currentEx < 6 ){
              scaleValue =  0.5;
            }
            if(6 <= currentEx ){
              scaleValue = 0.25;
            }
            scaleValue = scaleValue + 0.05 * student.profile.answers[l].attempt;
          }
        }
        opacity = scaleValue;
        timeline.to(avatar, 1, {scale: scaleValue, autoAlpha: opacity, ease: Ease.easeIn}, t+= 0.1);
        timeline.play();
      }
    }


    // FAKING DATA /!\
    // FAKING DATA /!\
    // FAKING DATA /!\
    // FAKING DATA /!\
    // FAKING DATA /!\
    var users = Meteor.users.find({
      "profile.account": "student"
    }, {sort: { username: 1} }).fetch();

    for(var j = 0; j < parseInt(users.length); j++){
      scaleValue = opacity = 1;
      var student = users[j];
      if(student){
        if(student.username != "Abla Louna" && student.username != "Begidis Alban" && student.username != "Bihannic Etienne" ){
          var student_image_name;
          student_image_name = student.username.replace(/\s/g, "_");
          var avatar = $("#avatar-"+student_image_name);
          t = 0;
          timeline = new TimelineMax({paused: true});
          if(currentEx == 0){
            // scaleValue = Math.random() * (1.4 - 0.5) + 0.5;
          }
          else{
            if(currentEx < 3 ){
              scaleValue = Math.random() * (1.4 - 0.8) + 0.8;
            }
            if(3 <= currentEx < 6 ){
              scaleValue = Math.random() * (1 - 0.5) + 0.5;
            }
            if(6 <= currentEx ){
              scaleValue = Math.random() * (0.8 - 0.5) + 0.5;
            }
          }          
          opacity = scaleValue;

          timeline.to(avatar, 13, {scale: scaleValue, autoAlpha: opacity, ease: Ease.easeIn}, t+= 0.1);
          timeline.play();
        }
      }
    }
  },

  "popupGetNameWithUnderscore": function(){
    var popUp = PopupEvents.findOne({name: 'student'});
    if(popUp){
      var user = Meteor.users.find({
        "_id": popUp.user_id
      }).fetch();
      if(user[0]){
        var image_name;
        image_name = user[0].username.replace(/\s/g, "_");
        return image_name;      
      }
    }
    else{
      return "";
    }
  },

  "popupGetName": function(){
    var popUp = PopupEvents.findOne({name: 'student'});
    if(popUp){
      var user = Meteor.users.find({
      "_id": popUp.user_id
      }).fetch();
      if(user[0]){
        return user[0].username;    
      }
    }
  },

  "popupGetStudentProgress":function(){
    var popUp = PopupEvents.findOne({name: 'student'});
    if(popUp){
      var user = Meteor.users.find({
      "_id": popUp.user_id
      }).fetch();
      if(user[0]){
        var currentEx = 0;
        for(var i = 0; i < user[0].profile.answers.length; i++){
          if(currentEx < user[0].profile.answers[i].currentEx){
            currentEx = user[0].profile.answers[i].currentEx;
          }
        }
        var exercicesNumber = Exercices.find().fetch().length;
        return parseInt((currentEx/exercicesNumber)*100);        
      }
    }
    else{
      return "";
    }
  },

  "popupExerciceTimeline":function(){
    var current, currentEx, currentExNumber, i, item, j;
    var exercicesNumber = Exercices.find().fetch().length;
    var popUp           = PopupEvents.findOne({name: 'student'});
    currentExNumber     = 0;
    i                   = 0;
    if(popUp){
      var user = Meteor.users.find({
      "_id": popUp.user_id
      }).fetch();

      if(user[0]){
        var student = user[0];
        while (i < student.profile.answers.length) {
          current = student.profile.answers[i];
          if (current.isCurrent == true) {
            currentEx = Exercices.find({
              "_id": current.exercice_id
            }).fetch();
            if(currentExNumber < currentEx[0].number){
              currentExNumber = currentEx[0].number;
            }
          }
          i++;
        }
        if (this.number < currentExNumber) {  
          return "previous";
        }
        if (this.number == currentExNumber) {
          return "current";
        }
        if (this.number > currentExNumber) {
          return "next";
        } 
      }
    }
  },

  "popupgetStatementExercice":function(){
    var current, currentEx, currentExNumber, i, item, j;
    var exercicesNumber = Exercices.find().fetch().length;
    var popUp           = PopupEvents.findOne({name: 'student'});
    currentExNumber     = 0;
    i                   = 0;
    if(popUp){
      var user = Meteor.users.find({
      "_id": popUp.user_id
      }).fetch();
      if(user[0]){
        var student = user[0];
        while (i < student.profile.answers.length) {
          current = student.profile.answers[i];
          if (current.isCurrent == true) {
            currentEx = Exercices.find({
              "_id": current.exercice_id
            }).fetch();
            if(currentExNumber < currentEx[0].number){
              currentExNumber = currentEx[0].number;
            }
          }
          i++;
        }
        var exercice = Exercices.find({"number": currentExNumber}).fetch();
        if(exercice[0]){
          return exercice[0].question;
        }
      }
    }
  },

  "popupgetGoodAnswerExercice":function(){
    var current, currentEx, currentExNumber, i, item, j;
    var exercicesNumber = Exercices.find().fetch().length;
    var popUp           = PopupEvents.findOne({name: 'student'});
    currentExNumber     = 0;
    i                   = 0;
    if(popUp){
      var user = Meteor.users.find({
      "_id": popUp.user_id
      }).fetch();

      var student = user[0];
      while (i < student.profile.answers.length) {
        current = student.profile.answers[i];
        if (current.isCurrent == true) {
          currentEx = Exercices.find({
            "_id": current.exercice_id
          }).fetch();
          if(currentExNumber < currentEx[0].number){
            currentExNumber = currentEx[0].number;
          }
        }
        i++;
      }
      var exercice = Exercices.find({"number": currentExNumber}).fetch();
      if(exercice[0].answers.right){
        return exercice[0].answers.right;
      }
    }
  },
 
  "popupGetStudentAnswerExercice":function(){
    var current, currentEx, currentExNumber, i, item, j;
    var exercicesNumber = Exercices.find().fetch().length;
    var popUp           = PopupEvents.findOne({name: 'student'});
    currentExNumber     = 0;
    i                   = 0;
    if(popUp){
      var user = Meteor.users.find({
        "_id": popUp.user_id
      }).fetch();
      if(user[0]){
        var student = user[0];
        if(student.profile){
          while (i < student.profile.answers.length) {
            current = student.profile.answers[i];
            if (current.isCurrent == true) {
              currentEx = Exercices.find({
                "_id": current.exercice_id
              }).fetch();
              if(currentExNumber < currentEx[0].number){
                currentExNumber = currentEx[0].number;
              }
            }
            i++;
          }          
        }
        if(user[0].profile.answers[currentExNumber-1]){
          if(user[0].profile.answers[currentExNumber-1].answer == ""){
            return "Pas encore de réponse !";
          }
          else{
            return user[0].profile.answers[currentExNumber-1].answer;
          }
        }
      }
    }
  },

  "popupGetAttemps":function(){
    var current, currentEx, currentExNumber, i, item, j;
    var exercicesNumber = Exercices.find().fetch().length;
    var popUp           = PopupEvents.findOne({name: 'student'});
    currentExNumber     = 0;
    i                   = 0;
    if(popUp){
      var user = Meteor.users.find({
        "_id": popUp.user_id
      }).fetch();

      var student = user[0];
      if(user[0]){
        while (i < student.profile.answers.length) {
          current = student.profile.answers[i];
          if (current.isCurrent == true) {
            currentEx = Exercices.find({
              "_id": current.exercice_id
            }).fetch();
            if(currentExNumber < currentEx[0].number){
              currentExNumber = currentEx[0].number;
            }
          }
          i++;
        }
        if(user[0].profile.answers[currentExNumber-1]){
          if(user[0].profile.answers[currentExNumber-1].attempt){
            return user[0].profile.answers[currentExNumber-1].attempt;
          }
          else{
            return 0;
          }        
        }
      }
    }
  },

  "getAllStudentsProgress": function(){
    var numberTotalExCurrent = 0;
    var users                = Meteor.users.find({
    "profile.account": "student"
    }, {sort: { username: 1} }).fetch();
    
    for(var l = 0; l < users.length; l ++){
      var student   = users[l];
      var currentEx = 0;
      for(var i = 0; i < student.profile.answers.length; i++){
        if(currentEx < student.profile.answers[i].currentEx){
          currentEx            = student.profile.answers[i].currentEx;
          numberTotalExCurrent +=currentEx;
        }
      }
    }
    var exercicesNumber = Exercices.find().fetch().length;
    var returned        = (numberTotalExCurrent/(exercicesNumber*users.length))*100;
    

    setTimeout(function(){
      var bar           = $(".bar") ;
      var t             = 0;
      var tm            = new TimelineMax({paused: true});
      var progressValue = (returned)*100/1024;

      tm.to(bar, 0.8, {width: progressValue*50+"px", ease: Ease.easeInOut, delay: t});
      tm.play();      
    }, 1000);
  }
});
