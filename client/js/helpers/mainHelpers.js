Template.registerHelper("getExercices", function(){
	return Exercices.find().fetch();
});

Template.registerHelper("isEmptyArray", function(array){
	return array.length < 1;
});


Template.registerHelper("sortAnswers", function(answers){
  var together = answers.wrong;
  together.push( answers.right );

	var currentIndex = together.length, temporaryValue, randomIndex ;

	// While there remain elements to shuffle...
	while (0 !== currentIndex) {
    // Pick a remaining element...
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;

  	// And swap it with the current element.
  	temporaryValue = together[currentIndex];
  	together[currentIndex] = together[randomIndex];
  	together[randomIndex] = temporaryValue;
	}

	return together;
});


Template.registerHelper("connectedStudents", function(){
  return Meteor.users.find({
    "profile.connected": true
  }).fetch();
});

Template.registerHelper("everyStudents", function(){
  return Meteor.users.find({
    "profile.account": "student"
  }, {sort: { username: 1} });
});


Template.registerHelper("isTeacher", function(user){
  if (null == user)
    return false;
  return user.profile.account === "teacher";
});

Template.registerHelper("log", function(param){
  console.log("LOG : ", param );
});


Template.registerHelper("getStudentAnswer", function(param){
  var student = Template.currentData().student;
  var question = Template.currentData().exercice;
  if ( student != null && question != null)
  {
    for (var i = 0; i < student.profile.answers.length; i++) {
      var current = student.profile.answers[i];
      if (current.exercice_id == question._id)
          return current.answer;
    }
  }
  
});

Template.registerHelper("getStudentComment", function(param){
  var student = Template.currentData().student;
  var question = Template.currentData().exercice;
  if ( student != null && question != null)
  {
    for (var i = 0; i < student.profile.answers.length; i++) {
      var current = student.profile.answers[i];
      if (current.exercice_id == question._id)
          return current.comment;
    }
  }
  
});

Template.registerHelper("getOriginalQuestion", function(id){
  return Exercices.findOne({
    _id: id
  });
});

Template.registerHelper("gotToExercices", function(user){
  var exercices =  Exercices.findOne();
  if(user.profile.account == "student"){
    Router.go('/student/'+user._id+'/'+exercices._id);
  } 
});


Template.registerHelper("gotToHome", function(user){
  if(user.profile.account == "student"){
    Router.go('/');
  } 
});
