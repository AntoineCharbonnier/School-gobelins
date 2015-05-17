Template.data.helpers({
  'setSVG': function() {
    var circlue_cut, circlue_cut_wired;
    circlue_cut = $(".circlue_cut");
    circlue_cut_wired = $(".circlue_cut_wired");
    TweenMax.set(circlue_cut, {
      strokeDasharray: "0px, 500px"
    });
    TweenMax.set(circlue_cut_wired, {
      strokeDasharray: "0px, 500px"
    });
  },
  'getNameWithUnderscore': function(student_Name) {
    var image_name;
    image_name = student_Name.replace(/\s/g, "_");
    return image_name;
  },
  "getStudentProgress": function(student){
    var currentEx = 0;
    for(var i = 0; i < student.profile.answers.length; i++){
      if(currentEx < student.profile.answers[i].currentEx){
        currentEx = student.profile.answers[i].currentEx;
      }
    }
    var exercicesNumber = Exercices.find().fetch().length;
    console.log("Exercice courant : ",currentEx);
    return parseInt((currentEx/exercicesNumber)*100)
  },
  "getStudentNumberHelp": function(student){
    var exercicesNumber = Exercices.find().fetch();
    var numberHelp = 0;
    for (var i = 0; i < exercicesNumber.length; i++) {
      for(var j = 0; j < student.profile.answers.length; j++){
        if(student.profile.answers[j].needHelp){
          numberHelp += 1;
        }          
      } 
    }
    return numberHelp;
  },
  "getStudentNumberAttemps": function(student){
    var exercicesNumber = Exercices.find().fetch();
    var numberAttemp = 0;
    for (var i = 0; i < exercicesNumber.length; i++) {
      for(var j = 0; j < student.profile.answers.length; j++){
        if(student.profile.answers[j].attempt){
          numberAttemp += student.profile.answers[j].attempt;
        }          
      } 
    }
    return numberAttemp;
  },
  "getStudentNumberTime": function(student){
    var exercicesNumber = Exercices.find().fetch();
    var time = 0;
    for (var i = 0; i < exercicesNumber.length; i++) {
      for(var j = 0; j < student.profile.answers.length; j++){
        if(student.profile.answers[j].time){
          time += student.profile.answers[j].time;
        }          
      } 
    }
    var minutes = Math.floor(time / 60000);
    var seconds = ((time % 60000) / 1000).toFixed(0);
    if(minutes < 10){
      minutes = "0"+minutes;
    }
    return minutes + ":" + (seconds < 10 ? '0' : '') + seconds
  },
  "getAllStudentsProgress": function(){
    var numberTotalExCurrent = 0;
    var users = Meteor.users.find({
    "profile.account": "student"
    }, {sort: { username: 1} }).fetch();
    
    for(var l = 0; l < users.length; l ++){
      var student = users[l];
      var currentEx = 0;
      for(var i = 0; i < student.profile.answers.length; i++){
        if(currentEx < student.profile.answers[i].currentEx){
          currentEx = student.profile.answers[i].currentEx;
          numberTotalExCurrent+=currentEx;
        }
      }
      var currentProfile = currentEx;
      // console.log("new current : ",currentProfile);
      if(!currentProfile){
        currentProfile = 0;
      }

      Meteor.users.update({
        _id : student._id
      }, {
        $set: {
          "profile.currentExercice": currentProfile
        }
      });
    }





    var exercicesNumber = Exercices.find().fetch().length;
    // console.log("Exercice courant : ",currentEx);
    var returned = (numberTotalExCurrent/(exercicesNumber*users.length))*100;
    
    var circlue_cut = $(".circlue_cut") ;
    var circlue_cut_wired = $(".circlue_cut_wired") ;
    // TweenMax.set circlue_cut, strokeDasharray: "0px, 500px"
    // TweenMax.set circlue_cut_wired, strokeDasharray: "0px, 500px"
    
    var t = 0;
    var tm = new TimelineMax({paused: true});
    var rotationValue = Math.round((Math.round(returned)*500/100));
    tm.to(circlue_cut_wired, 2, {strokeDasharray: "500px, 500px", ease: Ease.easeInOut, delay: t+=2});
    tm.to(circlue_cut, 2, {strokeDasharray: rotationValue+"px, 500px", ease: Ease.easeInOut, delay: t});
    tm.play();

    return Math.round(returned);
  },
  "getAllStudentsNumberAttemps": function(){
    var users = Meteor.users.find({
    "profile.account": "student"
    }, {sort: { username: 1} }).fetch();
    
    var exercicesNumber = Exercices.find().fetch();
    var numberAttemp = 0;
    for(var k = 0; k < users.length; k ++){
      var student = users[k];
      for (var i = 0; i < exercicesNumber.length; i++) {
        for(var j = 0; j < student.profile.answers.length; j++){
          if(student.profile.answers[j].attempt){
            numberAttemp += student.profile.answers[j].attempt;
          }          
        } 
      }
    }

    return numberAttemp;
  },
  "getAllStudentsNumberTime": function(){
    var users = Meteor.users.find({
    "profile.account": "student"
    }, {sort: { username: 1} }).fetch();

    var exercicesNumber = Exercices.find().fetch();
    var time = 0;
    for(var k = 0; k < users.length; k ++){
      var student = users[k];
      for (var i = 0; i < exercicesNumber.length; i++) {
        for(var j = 0; j < student.profile.answers.length; j++){
          if(student.profile.answers[j].time){
            time += student.profile.answers[j].time;
          }          
        } 
      }
    }

    var minutes = Math.floor(time / 60000);
    if(minutes < 10){
      minutes = "0"+minutes;
    }
    return minutes;
  },
});