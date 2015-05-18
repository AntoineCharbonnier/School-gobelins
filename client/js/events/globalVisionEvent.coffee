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
    appEvents = AppEvents.findOne(name: 'displayer')
    AppEvents.update { 
      _id: appEvents._id 
      }, 
      $set: {
        "module": "display-data"
      }
    return