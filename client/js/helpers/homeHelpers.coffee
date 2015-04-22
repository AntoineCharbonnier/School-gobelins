Template.home.helpers 
  'isDisplayingExerices': ->
    appEvents = AppEvents.findOne(name: 'displayer')
    console.log 'DISPLAY EVENTS', appEvents
    if(appEvents.module == "display-exercice")
      return true
  'isDisplayingClasses': ->
    appEvents = AppEvents.findOne(name: 'displayer')
    console.log 'DISPLAY EVENTS', appEvents
    if(appEvents.module == "display-classes")
      return true

  'isDisplayingWaiting': ->
    appEvents = AppEvents.findOne(name: 'displayer')
    console.log 'DISPLAY EVENTS', appEvents
    if(appEvents.module == "")
      return true