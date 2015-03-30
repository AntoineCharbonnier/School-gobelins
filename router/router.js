Router.configure({
  layoutTemplate: "app"
});

// Router.onBeforeAction(function() {
//   if (! Meteor.userId()) {
//     this.render('home');
//   } else {
//     this.next();
//   }
// });

Router.route("/","home");



Router.route("/student/:id",function(){
  var data = Meteor.users.findOne({
    _id : this.params.id
  });
  console.log(data);
  this.render("student",{
    data: data
  });
});

Router.route("/student/:id/:exercice_id",function(){
  var exercice = Exercices.findOne({
    _id : this.params.exercice_id
  });
  var student = Meteor.users.findOne({
    _id : this.params.id
  });
  var index = 0;

  if (student) {
    var exist = false;
    for (var i = 0; i < student.profile.answers.length; i++) {
      var current = student.profile.answers[i];
      if (this.params.exercice_id == current.exercice_id) {
          exist = true;
          index = i;
      } 
    }

    if ( ! exist ) {
        Meteor.users.update({
          _id : this.params.id
        }, {
          $push: {
            "profile.answers": {
              "exercice_id": this.params.exercice_id,
              "answer": '',
              "attempt": 0,
              "start": Date.now(),
              "isCurrent": true, 
              "comment": ""
            }
          }
        });
    } else {
      var answer = {};

      answer["profile.answers." + index + '.isCurrent'] = true;

      Meteor.users.update({
          _id : this.params.id
        }, {
          $set: answer
      });
    }
  }
  

  this.render("exercice",{
    data: {
      exercice: exercice,
      student: Meteor.users.findOne({
        _id : this.params.id
      })
    }
  });

});