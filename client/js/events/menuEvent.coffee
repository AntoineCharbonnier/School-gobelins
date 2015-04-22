Template.menu.events 
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
  
  'click #display-classes': (e) ->
    appEvents = AppEvents.findOne(name: 'displayer')
    AppEvents.update { 
      _id: appEvents._id 
      }, 
      $set: {
        "module": "display-classes"
      }
    console.log "DISPLAYER TEACHER", AppEvents.findOne(name: 'displayer')
    return

  'click #display-waiting': (e) ->
    appEvents = AppEvents.findOne(name: 'displayer')
    AppEvents.update { 
      _id: appEvents._id 
      }, 
      $set: {
        "module": ""
      }
    console.log "DISPLAYER TEACHER", AppEvents.findOne(name: 'displayer')
    return