Template.globalVision.gestures 
  # 'press .container-global-vision': (event, template) ->
  #   event.preventDefault()
  #   # template.preventDefault()
  #   # this.preventDefault()

  #   console.log "YOY"
  #   ### Do something when user swipes left on .item .panel (elements(s) inside the template html) ###

  #   ### `event` is the Hammer.js event object ###

  #   ### `template` is the `Blaze.TemplateInstance` ###

  #   ### `this` is the data context of the element in your template ###

  #   return

  'press .container-global-vision ul.global li': (event,template) ->
    # event.preventDefault()
    console.log event
    # timeline = new TimelineMax paused: true
