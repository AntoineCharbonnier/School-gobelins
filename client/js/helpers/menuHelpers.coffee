Template.menu.helpers 
  'getNameWithUnderscore': (student_Name)->
    console.log student_Name
    if student_Name == "Philippe Neveu"
      return "prof"
    else
      image_name = student_Name.replace(/\s/g, "_")
      return image_name





  'isDisplayingSelected': ->
    displayerEvent = AppEvents.findOne(name: 'displayer')
    DM = displayerEvent.module
    # ESPACE CLASSE    
    if(DM == "display-exercice" || DM == "display-send-exercice" || DM == "display-global-vision" ||DM == "display-group" || DM == "display-data")
      previouslySelected = $ ".selected"
      goingToBeSelected  = $ "#display-exercice"
      
    # MANUEL SCOLAIRE
    else if(displayerEvent.module == "display-classes")   
      previouslySelected = $ ".selected"
      goingToBeSelected  = $ "#display-classes"      


    t = 0
    tm = new TimelineMax paused: true
    tm.to( previouslySelected, .3, {className: "-=selected"},t+=.1)
    tm.to( goingToBeSelected, .3, {className: "+=selected"},t+=.1)

    tm.play()
    return ""



  # 'isDisplayingClasses': ->
  #   displayerEvent = AppEvents.findOne(name: 'displayer')
  #   if(displayerEvent.module == "display-classes")
  #     console.log "YOOOOOOO"
  #     t = 0
  #     previouslySelected = $ ".selected"
  #     goingToBeSelected  = $ "#display-classes"

  #     tm = new TimelineMax paused: true
  #     tm.to( previouslySelected, .3, {className: "-=selected"},t+=.1)
  #     tm.to( goingToBeSelected, .3, {className: "+=selected"},t+=.1)

  #     tm.play()
  #     return ""

# JE SAIS PAS ENCORE

  # 'isDisplayingWaiting': ->
  #   displayerEvent = AppEvents.findOne(name: 'displayer')
  #   if(displayerEvent.module == "display-group" || displayerEvent.module == "display-data")
  #     return true

  # 'isDisplayingNothing': ->
  #   displayerEvent = AppEvents.findOne(name: 'displayer')
  #   if(displayerEvent.module == "" || displayerEvent.module == "display-send-exercices"  )
  #     return true
