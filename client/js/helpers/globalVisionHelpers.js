Template.globalVision.helpers({
  "getStudentNumber": function() {
      return Meteor.users.find({
        "profile.connected": true
      }).fetch().length;
  }
  // "getStudentNumber": function() {
  //     return Meteor.users.find({
  //       "profile.connected": true
  //     }).fetch().length;
  // }
});
