Template.sendExercices.events
  'click ul li a': (e) ->
    image = $ "#"+e.target.id

    t = 0
    tm = new TimelineMax paused: true

    tm.to( image, 2, {scale: 1,className:"-=transparent", autoAlpha: 1},t+=.1)
    tm.to( image, 2, {className:"+=boxed"},t+=.1)
    tm.play()
    return
  
  'click #display-global-vision': (e) ->
    appEvents = AppEvents.findOne(name: 'displayer')
    AppEvents.update { 
      _id: appEvents._id 
      }, 
      $set: {
        "module": "display-classes"
      }
    return
  
  'click #select-all-classes': (e) ->
    users = Meteor.users.find(
      'profile.connected': true
      'profile.account': 'student').fetch()
    t = 0
    tm = new TimelineMax paused: true
   
    i = 0
    while i < users.length
      # if student.profile.answers[i].needHelp
      #   return true
      image_name = users[i].username.replace(/\s/g,"_")
      image = $ "#avatar-#{image_name}"


      # tm.to( image, 2, {scale: 1,className:"-=transparent", autoAlpha: 1},t+=.1)
      tm.to( image, 2, {className:"+=boxed"},t+=.1)
      

      i++
    tm.play()
    return