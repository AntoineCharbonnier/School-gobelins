Template.globalVision.events
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
    console.log AppEvents.findOne(name: 'displayer')
    return
  
  'click #time-is-over': (e) ->
    users = Meteor.users.find(
      'profile.connected': true
      'profile.account': 'student').fetch()
    i = 0
    while i < users.length
      image_name = users[i].username.replace(/\s/g,"_")
      image = $ "#avatar-#{image_name}"

      t = 0
      tm = new TimelineMax paused: true

      tm.to( image, 2, {css: {scale: 0.5}},t+=.1)
      tm.play()

      i++
    
    progressBar = $ ".container-global-vision .progess__bar .bar"
    
    t2 = 0
    tm2 = new TimelineMax paused: true

    tm2.to( progressBar, 2, width: "600px",t2+=.1)
    tm2.play()

    return