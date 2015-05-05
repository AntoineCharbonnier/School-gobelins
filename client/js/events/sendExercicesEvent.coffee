Template.sendExercices.events
  'click ul li a': (e) ->
    console.log "clicked : ",e.target.id

    image = $ "#"+e.target.id

    # TweenMax.set image, autoAlpha: 0, width: "0px", height: "0px"

    t = 0
    tm = new TimelineMax paused: true

    # tm.to( image, 0.4, {autoAlpha: 1, ease: Back.easeOut}, t+=.1)
    tm.to( image, 2, {className:"-=transparent", autoAlpha: 1},t+=.1)
    # tm.to( image, 2, {, ease: Ease.easeIn}, t+=.1)
    # clip:"rect(50px 50px 50px 50px)",
    # tm.to( image, 0.5, {height:"65px", width:"65px", ease: Back.easeOut}, t+=.1)
    # tm.to( image, 0.5, {height:"30px", width:"30px", ease: Back.easeOut}, t+=.5)
    # tm.to( image, 0.5, {height:"65px", width:"65px", ease: Back.easeOut}, t+=.1)
    # tm.to( image, 0.5, {height:"30px", width:"30px", ease: Back.easeOut}, t+=.5)
    # tm.to( image, 0.1, {height:"74px", width:"74px", ease: Back.easeOut}, t+=.1)
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
    console.log "DISPLAYER TEACHER", AppEvents.findOne(name: 'displayer')    
    return