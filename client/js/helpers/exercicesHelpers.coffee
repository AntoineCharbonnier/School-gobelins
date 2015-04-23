Template.exercices.helpers
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

