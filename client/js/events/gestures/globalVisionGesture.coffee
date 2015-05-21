Template.globalVision.gestures 
  # 'press .container-global-vision': (event, template) ->
  #   # event.preventDefault()
  #   # template.preventDefault()
  #   # this.preventDefault()

  #   console.log "YOY"
  #   console.log event.type
  #   ### Do something when user swipes left on .item .panel (elements(s) inside the template html) ###

  #   ### `event` is the Hammer.js event object ###

  #   ### `template` is the `Blaze.TemplateInstance` ###

  #   ### `this` is the data context of the element in your template ###

  #   return

  'panleft .container-global-vision': (event,template) ->
    # event.preventDefault()
    console.log event.type
    console.log "yo"
    # timeline = new TimelineMax paused: true
    return
  
  'press .avatar__selector': (event,template) ->
    # event.preventDefault()
    console.log event.type
    console.log "LI"
    # timeline = new TimelineMax paused: true
    return
