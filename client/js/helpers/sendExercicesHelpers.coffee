Template.sendExercices.helpers 
  'isStudentNeedHelp': (student) ->
    # console.log 'STUDENT', student
    i = 0
    while i < student.profile.answers.length
      if student.profile.answers[i].needHelp
        return true
      i++
    return
  
  'getNameWithUnderscore': (student_Name) ->
    image_name = student_Name.replace(/\s/g,"_")
    console.log image_name
    return image_name

  # 'isConnected': (student) ->
  #   if(student.profile.connected)
  #     return true
  #   else 
  #     return false
