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

