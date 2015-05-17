Template.home.helpers 
  'isDisplayingExerices': ->
    displayerEvent = AppEvents.findOne(name: 'displayer')
    if(displayerEvent.module == "display-exercice")
      return true

  'isDisplayingSendExercices': ->
    displayerEvent = AppEvents.findOne(name: 'displayer')
    if(displayerEvent.module == "display-send-exercice")
      return true

  'isDisplayingGlobalVision': ->
    displayerEvent = AppEvents.findOne(name: 'displayer')
    if(displayerEvent.module == "display-global-vision")
      return true

  'isDisplayingClasses': ->
    displayerEvent = AppEvents.findOne(name: 'displayer')
    if(displayerEvent.module == "display-classes")
      return true

  'isDisplayingGroup': ->
    displayerEvent = AppEvents.findOne(name: 'displayer')
    if(displayerEvent.module == "display-group")
      return true

  'isDisplayingData': ->
    displayerEvent = AppEvents.findOne(name: 'displayer')
    if(displayerEvent.module == "display-data")
      return true



  'isDisplayingWaiting': ->
    displayerEvent = AppEvents.findOne(name: 'displayer')
    if(displayerEvent.module == "" || displayerEvent.module == "display-group" || displayerEvent.module == "display-send-exercices" || displayerEvent.module == "display-data")
      return true