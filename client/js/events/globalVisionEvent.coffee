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

  'click .container-global-vision ul li a': (e)->
    popupEvents = PopupEvents.findOne(name: 'student')
    PopupEvents.update { 
      _id: popupEvents._id 
      }, 
      $set: {
        "user_id": e.currentTarget.id
      }

    t = 0
    popup                  = $ ".container-global-vision .pop-up"
    
    pop_up__top_content    = $ ".container-global-vision .pop-up .frame .pop-up__top-content"
    pop_up__top_content_h2 = $ ".container-global-vision .pop-up .frame .pop-up__top-content h2"
    pop_up__content_h6     = $ ".container-global-vision .pop-up .frame .pop-up__content .exercice-list h6"
    pop_up__content_h4     = $ ".container-global-vision .pop-up .frame .pop-up__content .exercice-list h4"
    exercice_list_number   = $ ".container-global-vision .pop-up .frame .pop-up__content .exercice-list ul li"
    students_list          = $ ".container-global-vision .pop-up .students-list ul li img"
    
    TweenMax.set [pop_up__top_content_h2,popup,pop_up__top_content,pop_up__content_h6,pop_up__content_h4,exercice_list_number,students_list], autoAlpha: 0
    TweenMax.set [exercice_list_number,students_list], y: 1000

    tm = new TimelineMax paused: true

    tm.to( popup, 2, {className:"-=hide", autoAlpha: 1},t+=.1)
    tm.to( popup, 2, {autoAlpha: 1},t+=.1)
    tm.to( [pop_up__top_content_h2,pop_up__top_content,pop_up__content_h6,pop_up__content_h4,exercice_list_number,students_list], .1, {autoAlpha: 0},t+=2)
    tm.to( pop_up__top_content, .5, {autoAlpha: 1},t+=.1)
    tm.to( pop_up__top_content_h2, .5, {autoAlpha: 1},t+=.1)
    tm.to( [pop_up__content_h6,pop_up__content_h4,students_list], .1, {autoAlpha: 0},t+=.1)
    tm.staggerTo(exercice_list_number, .5, {autoAlpha: 1,y:0, ease: Ease.easeOut}, .1)
    tm.to( [pop_up__content_h6,pop_up__content_h4], .5, {autoAlpha: 1},t+=.1)
    tm.staggerTo(students_list, .5, {autoAlpha: 1,y:0, ease: Ease.easeOut}, .1)
   
    tm.play()
  
  
  'click .container-global-vision .pop-up .students-list ul li': (e)->
    popupEvents = PopupEvents.findOne(name: 'student')
    PopupEvents.update { 
      _id: popupEvents._id 
      }, 
      $set: {
        "user_id": e.currentTarget.id
      }

    t = 0
    popup = $ ".container-global-vision .pop-up"

    tm = new TimelineMax paused: true
    tm.to( popup, .1, {x: 5},t)
    tm.to( popup, .1, {x: -5},t+=.2)
    tm.to( popup, .1, {x: 0},t+=.2)

    tm.play()

  
  'click .container-global-vision .pop-up .frame .pop-up__top-content a#close': (e)->
    t = 0
    popup = $ ".container-global-vision .pop-up"

    tm = new TimelineMax paused: true

    tm.to( popup, .5, {scale: 0},t+=1)
    tm.to( popup, .5, {autoAlpha: 0},t+=2.1)
    tm.to( popup, 2, {className:"+=hide"},t+=.1)
    tm.play()

    TweenMax.set popup, scale: 1

