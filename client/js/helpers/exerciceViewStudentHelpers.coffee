Template.exerciceViewStudent.helpers
  'isChecked': (value, answer) ->
    if answer == value then 'selected' else ''
  'getNextExercice': (currentNumber) ->
    exercice = Exercices.findOne('number': currentNumber + 1)
    if exercice
      exercice._id
    else
      'end'
  'nextExerciceExist': (currentNumber) ->
    exercice = Exercices.findOne('number': currentNumber + 1)
    exercice
  'formatingExercice': (currentExercice) ->
    dividend = currentExercice.dividend
    denominator = currentExercice.denominator
    goodResult = currentExercice.answers.right
    return

  'isDisplayingClasses': (currentUser)->
    displayerEvent = AppEvents.findOne(name: 'displayer')
    if(displayerEvent.module == "display-classes" and currentUser.profile.account == "student")
      Router.go("/")

  'isMediumLevel': (exerciceLevel)->
    if exerciceLevel == "medium"
      return true

  'isHardLevel': (exerciceLevel)->
    if exerciceLevel == "hard"
      return true

  'getUnit': (number)->
    return ( number % 10 )

  'getNumberFirstStepDivision': (number)->
    return parseInt(number / 10)

  'isNeedingAssitance': () ->
    student = Template.currentData().student
    question = Template.currentData().exercice
    returned = undefined
    i = 0
    while i < student.profile.answers.length
      current = student.profile.answers[i]
      if current.exercice_id == question._id
        if current.needhelp
          returned = true
        else
          returned = false
      i++
    return returned
  'listNumberExercices': (student) ->
    console.log "student",student
    exercicesNumber = Exercices.find().fetch().length
    
    i = 0
    while i < student.profile.answers.length
      current = student.profile.answers[i]
      if current.isCurrent == true
        currentEx = Exercices.find({"_id":current.exercice_id}).fetch()
        console.log "EX : ",currentEx
      i++
    
    console.log "NUMBER : ", currentEx[0].number
    currentExNumber =  currentEx[0].number
    html = ""
    # # $(".timeline-exercices ul li").remove()
    # # ul = document.getElementById("test");
    # # li = document.createElement("li");
    # # li.appendChild(document.createTextNode("Four"));
    # # ul.appendChild(li);
    # j = 0
    # # while j <= exercicesNumber
    # #   if j < currentExNumber
    # #   if j == currentExNumber
    # #   if j > currentExNumber
      


    # #   j++
    

    console.log "HTML : ",html

    # $("#timeline").html($('<div>', {class: 'spinner'}))

  'listExercicesStyle': (student)->

