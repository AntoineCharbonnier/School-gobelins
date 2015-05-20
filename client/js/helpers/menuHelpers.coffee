Template.menu.helpers 
  # 'isDisplayingExerices': ->
  #   displayerEvent = AppEvents.findOne(name: 'displayer')
  #   if(displayerEvent.module == "display-exercice")
  #     return true

  # 'isDisplayingClasses': ->
  #   displayerEvent = AppEvents.findOne(name: 'displayer')
  #   if(displayerEvent.module == "display-classes")
  #     return true

  # 'isDisplayingWaiting': ->
  #   displayerEvent = AppEvents.findOne(name: 'displayer')
  #   if(displayerEvent.module == "")
  #     return true
  'getNameWithUnderscore': (student_Name)->
    image_name = student_Name.replace(/\s/g, "_")
    return image_name