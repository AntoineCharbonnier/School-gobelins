// Template.globalVision.helpers({
//   "getStudentNumber": function() {
//       return Meteor.users.find({
//         "profile.connected": true
//       }).fetch().length;
//   },
//   "getNumberStudentValidExercice": function(the_exercice_id) {
//     var users = Meteor.users.find({
//       "profile.connected": true
//     }).fetch();
//     var numberValidatedStudents = 0;
//     for (var i = 0; i < users.length; i++) {
//       var current = users[i];
//       for(var j = 0; j < current.profile.answers.length; j++){
//         if (current.profile.answers[j].exercice_id == the_exercice_id){
//           if(current.profile.answers[j].validated){
//             numberValidatedStudents ++;
//           }          
//         }
//       } 
//     }
//     return numberValidatedStudents;
//   },
  
//   "getAttemptsExercice": function(the_exercice_id) {
//     var users = Meteor.users.find({
//       "profile.connected": true
//     }).fetch();
//     var attempsAverrage = 0;
//     for (var i = 0; i < users.length; i++) {
//       var current = users[i];
//       for(var j = 0; j < current.profile.answers.length; j++){
//         if (current.profile.answers[j].exercice_id == the_exercice_id){
//           if(current.profile.answers[j].attempt){
//             attempsAverrage += current.profile.answers[j].attempt;
//           }          
//         }
//       } 
//     }
//     return attempsAverrage;
//   },

//   "getDurationExercice": function(the_exercice_id, booleanString) {
//     var users = Meteor.users.find({
//       "profile.connected": true
//     }).fetch();
//     var timeAverrage = 0;
//     for (var i = 0; i < users.length; i++) {
//       var current = users[i];
//       for(var j = 0; j < current.profile.answers.length; j++){
//         if (current.profile.answers[j].exercice_id == the_exercice_id){
//           if(current.profile.answers[j].time){
//             timeAverrage += current.profile.answers[j].time;
//           }          
//         }
//       } 
//     }
//     if(booleanString){
//       var minutes = Math.floor(timeAverrage / 60000);
//       var seconds = ((timeAverrage % 60000) / 1000).toFixed(0);
//       if(minutes < 10){
//         minutes = "0"+minutes;
//       }
//       return minutes + ":" + (seconds < 10 ? '0' : '') + seconds
//     }
//     else{
//       return timeAverrage;
//     }
//   },

//   "getTotalDurationExercice": function(booleanString) {
//     timerTotalDuration = function() {
//       var users = Meteor.users.find({
//         "profile.connected": true
//       }).fetch();

//       var exercices = Exercices.find().fetch();

//       var numberUserFinish = 0;
//       var everyUsersFinish = false;

//       var timeAverrage = 0;
//       var startTime = 0;
//       for (var i = 0; i < users.length; i++) {
//         var current = users[i];
//         for(var j = 0; j < current.profile.answers.length; j++){
//           var currentExercice = Exercices.find({
//             "_id": current.profile.answers[j].exercice_id
//           }).fetch();
//           for(var l = 0; l < currentExercice.length; l++){
//             if(currentExercice[l].number == exercices.length){
//               numberUserFinish++;
//               if (numberUserFinish >= users.length) {
//                 everyUsersFinish = true;
//               }
//             }
//           }
//           for(var k = 0; k < exercices.length; k++){
//             if (current.profile.answers[j].exercice_id == exercices[k]._id){
//                 startTime += current.profile.answers[j].start;
//               if(current.profile.answers[j].time){
//                 timeAverrage += current.profile.answers[j].time;
//               }          
//             }
//           }
//         } 
//       }


//       console.log(startTime);      
//       startTime = startTime / users.length;
//       console.log(startTime);
//       if(booleanString){
//         var minutes = Math.floor(timeAverrage / 60000);
//         var seconds = ((timeAverrage % 60000) / 1000).toFixed(0);
//         if(minutes < 10){
//           minutes = "0"+minutes;
//         }
//         if(everyUsersFinish){
//           $('#time').removeClass('is-not-defined');
//         }
//         if ($('#time').hasClass('is-not-defined')) {
//           var minutes = Math.floor(Date.now() - startTime / 60000);
//           var seconds = ((Date.now() - startTime % 60000) / 1000).toFixed(0);
//           console.log(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
//           $('#time').html(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
//         } else {
//           var minutes = Math.floor(timeAverrage / 60000);
//           var seconds = ((timeAverrage % 60000) / 1000).toFixed(0);
//           console.log(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
//           $('#time').html(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
//         }

//         // // ICI A FAIRE EN MODE TIMEOUT // BUG BUG BUG 
//         // if($(".time-container h2").html() == minutes+":"+seconds){
//         //   var minutes2 = Math.floor(startTime / 60000);
//         //   var seconds2 = ((startTime % 60000) / 1000).toFixed(0);
//         //   return minutes2 + ":" + (seconds2 < 10 ? '0' : '') + seconds2
//         // }
//         // else{
//         //   return minutes + ":" + (seconds < 10 ? '0' : '') + seconds
//         // }
//       }
//     }
//     interval = Meteor.setInterval(timerTotalDuration, 0.1);
//     // else{
//     //   return timeAverrage;
//     // }
//   },
//   "getNumberHelpExercice": function(the_exercice_id) {
//     var users = Meteor.users.find({
//       "profile.connected": true
//     }).fetch();
//     var numberHelp = 0;
//     for (var i = 0; i < users.length; i++) {
//       var current = users[i];
//       for(var j = 0; j < current.profile.answers.length; j++){
//         if (current.profile.answers[j].exercice_id == the_exercice_id){
//           if(current.profile.answers[j].needHelp){
//             numberHelp += 1;
//             console.log("HELPS  : ",numberHelp);
//           }          
//         }
//       } 
//     }
//     return numberHelp;
//   },

//   "isStudentNeedHelp": function(student) {
//     var i;
//     i = 0;
//     while (i < student.profile.answers.length) {
//       if (student.profile.answers[i].needHelp) {
//         return true;
//       }
//       i++;
//     }
//   },
//   "getNameWithUnderscore": function(student_Name) {
//     var image_name;
//     image_name = student_Name.replace(/\s/g, "_");
//     console.log(image_name);
//     return image_name;
//   }
// });
