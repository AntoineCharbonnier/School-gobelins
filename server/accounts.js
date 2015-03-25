Meteor.startup(function() {
  Accounts.onLogin(function(data){
    console.log(data.user); 
    var user = data.user;
    if(user.profile.account == "student"){
      Meteor.users.update({
        _id: user._id
      }, {
        $set: {
          "profile.connected": true
        }
      });

      console.log( Meteor.users.findOne({ _id: user._id } ).profile );
    }
  });
});