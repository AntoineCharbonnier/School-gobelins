Template.classesShow.events
  'click #previous': (e) ->
    appEvents = AppEvents.findOne(name: 'indexClasses')
    newAppEvents = {}
    if appEvents.indexClasses > 0
      AppEvents.update { _id: appEvents._id }, $inc: indexClasses: -1
    return
  
  'click #next': (e) ->
    appEvents = AppEvents.findOne(name: 'indexClasses')
    newAppEvents = {}
    AppEvents.update { _id: appEvents._id }, $inc: indexClasses: 1
    console.log 'LOGGG', AppEvents.find().fetch()
    return