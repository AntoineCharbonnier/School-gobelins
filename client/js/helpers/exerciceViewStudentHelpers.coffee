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
    exercicesNumber = Exercices.find().fetch().length
    
    i = 0
    while i < student.profile.answers.length
      current = student.profile.answers[i]
      if current.isCurrent == true
        currentEx = Exercices.find({"_id":current.exercice_id}).fetch()
      i++
    
    currentExNumber =  currentEx[0].number
    j = 0
    while j <= exercicesNumber
      item = $("#list-item-"+j)
      if item 
        item.removeClass()
        if j < currentExNumber
          item.addClass("item-previous")
        if j == currentExNumber
          item.addClass("item-current")
        if j > currentExNumber
          item.addClass("item-next")
      j++

  'isDisplayingData': ->
    displayerEvent = AppEvents.findOne(name: 'displayer')
    if(displayerEvent.module == "display-data")
      return true