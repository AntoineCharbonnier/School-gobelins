Template.login.events({
    "submit form": function (e) {
        e.preventDefault();

        var data =  $(e.target).serializeJSON();

        Meteor.loginWithPassword(data.email, data.password, function(err) {
            if (!err) {
                console.log("Login successfully");
            } else {
                console.log("Error attempting to log in : ", err);
            }
        });

        return false;
    }
});