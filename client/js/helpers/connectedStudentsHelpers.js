Template.connectedStudents.helpers({
    "isStudentNeedHelp": function(student) {
    console.log("STUDENT", student);
    for (var i = 0; i < student.profile.answers.length; i++) {
      if(student.profile.answers[i].needHelp){
        return true;
      }
    }
  }
});