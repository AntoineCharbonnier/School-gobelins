Template.classesShow.events
  'click #previous': (e) ->
    appEvents = AppEvents.findOne(name: 'indexClasses')
    # console.log 'APP EVENTS', appEvents
    newAppEvents = {}
    # console.log 'NEW APP EVENTS', newAppEvents
    if appEvents.indexClasses > 0
      AppEvents.update { _id: appEvents._id }, $inc: indexClasses: -1
    # console.log 'LOGGG', AppEvents.find().fetch()
    return
  'click #next': (e) ->
    appEvents = AppEvents.findOne(name: 'indexClasses')
    # console.log 'APP EVENTS', appEvents
    newAppEvents = {}
    # console.log 'NEW APP EVENTS', newAppEvents
    AppEvents.update { _id: appEvents._id }, $inc: indexClasses: 1
    console.log 'LOGGG', AppEvents.find().fetch()
    return