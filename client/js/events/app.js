Template.app.events({
  "click #logout": function(e) {
    var currentUser = Meteor.user();

    Meteor.users.update({
        _id: currentUser._id
      }, {
        $set: {
          "profile.connected": false
        }
      });

    Meteor.logout();
  }
});