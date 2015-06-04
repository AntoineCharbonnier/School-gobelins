Template.groupCreation.helpers({
  "isStudentNeedHelp": function(student) {
    var image_name = student.username.replace(/\s/g,"_");
    var avatar     = $ ("#avatar-"+image_name);
    var currentEx  = 0;
    var t, tm;
    tm             = new TimelineMax({paused: true,repeat: 3, yoyo: false, repeatDelay: 3.0});
  },

  "getNameWithUnderscore": function(student_Name) {
    var image_name;
    image_name = student_Name.replace(/\s/g, "_");
    return image_name;
  },

  "groupCreationList": function(){
    return Groups.find().fetch();
  }

  // "updateStudentSwitchProgress": function(){
    // var users = Meteor.users.find({
    // "profile.account": "student"
    // }, {sort: { username: 1} }).fetch();

    // console.log("nb user : ",users.length);
    // for(var j = 0; j < parseInt(users.length); j++){
    //   var student = users[j];
    //   if(student){
    //     // console.log(users[j]);
    //     var student_image_name;
    //     student_image_name = student.username.replace(/\s/g, "_");
    //     var avatar = $("#avatar-"+student_image_name);
    //     var currentEx = 0;
    //     // currentEx = student.profile.currentExercice;
       
    //     t = 0;
    //     timeline = new TimelineMax({paused: true});


    //     var scaleValue = 1;
    //     var opacity = 1;
        
    //     for(var i = 0; i < student.profile.answers.length; i++){
    //       if(currentEx < student.profile.answers[i].currentEx){
    //         currentEx = student.profile.answers[i].currentEx;
    //       }
    //     }
    //     for(var l = 0; l < student.profile.answers.length; l ++){
    //       if(currentEx == student.profile.answers[l].currentEx){
    //         console.log("attempt ",student.profile.answers[l].attempt);
    //         scaleValue = scaleValue + 0.05 * student.profile.answers[l].attempt;
    //       }
    //     }
    //     console.log("Exercice courant : ",currentEx);

    //     if(currentEx == 0){
    //       //bug 
    //     }
    //     else{
    //       if(currentEx < 3 ){
    //         opacity = 1;
    //       }
    //       if(3 <= currentEx < 6 ){
    //         scaleValue = scaleValue - 0.3;
    //         opacity = 0.5;
    //       }
    //       if(6 <= currentEx ){
    //         scaleValue = scaleValue - 0.6;
    //         opacity = 0.25;
    //       }
    //     }
    //     // Meteor.users.update({
    //     //   _id : student._id
    //     // }, {
    //     //   $set: {
    //     //     "profile.scale": scaleValue
    //     //   }
    //     // })
    //     timeline.to(avatar, 1, {scale: scaleValue, autoAlpha: opacity, ease: Ease.easeIn}, t+= 0.1);
    //     timeline.play();
        
    //   }

    // }
  // }
});
