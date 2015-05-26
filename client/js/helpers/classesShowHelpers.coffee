Template.classesShow.helpers 
  'getIndexClasses': ->
    appEvents = AppEvents.findOne(name: 'indexClasses')
    if appEvents
      # console.log 'APP EVENTS', appEvents
      return parseInt(appEvents.indexClasses)+1
    return