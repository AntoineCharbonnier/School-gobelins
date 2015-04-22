Template.classesShow.helpers 
  'getIndexClasses': ->
    appEvents = AppEvents.findOne(name: 'indexClasses')
    if appEvents
      # console.log 'APP EVENTS', appEvents
      return appEvents.indexClasses
    return