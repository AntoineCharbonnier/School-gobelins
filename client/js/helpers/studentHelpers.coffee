Template.student.helpers
  'updateDurationStudentExercice': (current) ->
    timerDurationStudentExercice = ->
      if current.time
        $('#time-' + current.exercice_id).removeClass 'is-not-defined'
      if $('#time-' + current.exercice_id).hasClass('is-not-defined')
        $('#time-' + current.exercice_id).html Date.now() - current.start
      else
        $('#time' + current.exercice_id).html current.time
      return

    interval = Meteor.setInterval(timerDurationStudentExercice, 0.1)
    return
  'getNeedHelp': (student) ->
    if @needHelp
      'OUI'
    else
      'NON'