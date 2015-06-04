Template.sendExercices.helpers 
  'isStudentNeedHelp': (student) ->
    i = 0
    while i < student.profile.answers.length
      if student.profile.answers[i].needHelp
        return true
      i++
    return
  
  'getNameWithUnderscore': (student_Name) ->
    image_name = student_Name.replace(/\s/g,"_")
    return image_name

  'numberStudentsConnected': () ->
    students = Meteor.users.find({ 'profile.account': 'student', "profile.connected": true }).count()
    console.log students
    return students