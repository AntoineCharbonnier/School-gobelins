Template.sendExercices.events
  'click ul li a': (e) ->
    image = $ "#"+e.target.id

    t = 0
    tm = new TimelineMax paused: true

    tm.to( image, 2, {className:"-=transparent", autoAlpha: 1},t+=.1)
    tm.play()
    return
  
  'click #display-exercice': (e) ->
    appEvents = AppEvents.findOne(name: 'displayer')
    AppEvents.update { 
      _id: appEvents._id 
      }, 
      $set: {
        "module": "display-exercice"
      }
    return
  
  'click #select-all-classes': (e) ->
    users = Meteor.users.find(
      'profile.connected': true
      'profile.account': 'student').fetch()
    i = 0
    while i < users.length
      # if student.profile.answers[i].needHelp
      #   return true
      image_name = users[i].username.replace(/\s/g,"_")
      image = $ "#avatar-#{image_name}-overlay"

      t = 0
      tm = new TimelineMax paused: true

      tm.to( image, 2, {className:"-=transparent", autoAlpha: 1},t+=.1)
      tm.play()

      i++
    return