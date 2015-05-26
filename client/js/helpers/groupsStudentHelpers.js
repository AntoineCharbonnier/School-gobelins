// Template.groupsStudent.helpers({
//   "getNameWithUnderscore": function(student_Name) {
//     var image_name;
//     image_name = student_Name.replace(/\s/g, "_");
//     return image_name;
//   },

//   "groupCreationList": function(student_Name){
//     var groups =  Groups.find().fetch();
//     var users = Meteor.users.find({
//     "profile.account": "student"
//     }, {sort: { username: 1} }).fetch();

//     for(var i = 0; i < groups.lenght; i ++){
//       // for(var j = 0; j < users.lenght; j ++){
//         if(groups[i].user1 == student_Name || groups[i].user2 == student_Name || groups[i].user3 == student_Name || groups[i].user4 == student_Name){
          
//         }
//       // }
//     }
//   }
// }
