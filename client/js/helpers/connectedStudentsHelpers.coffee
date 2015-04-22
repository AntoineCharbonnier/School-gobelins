Template.connectedStudents.helpers 'isStudentNeedHelp': (student) ->
  # console.log 'STUDENT', student
  i = 0
  while i < student.profile.answers.length
    if student.profile.answers[i].needHelp
      return true
    i++
  return