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

  'click #logo-home': (e) ->
    # process.exit()

  'mouseover #display-menu': (e)->
    prevent   = no
    reversed  = no
    btn       = $ '#display-menu'

    line1     = $ ".svg--burger .line-1"
    line2     = $ ".svg--burger .line-2"
    line3     = $ ".svg--burger .line-3"
    line4     = $ ".svg--burger .line-4"

    return if prevent
    TweenLite.to line1, .2, y: 3, transformOrigin: "50% 50%"
    TweenLite.to line3, .2, y: -3, transformOrigin: "50% 50%"


  'mouseleave #display-menu': (e)->
    prevent   = no
    reversed  = no
    btn       = $ '#display-menu'

    line1     = $ ".svg--burger .line-1"
    line2     = $ ".svg--burger .line-2"
    line3     = $ ".svg--burger .line-3"
    line4     = $ ".svg--burger .line-4"

    console.log "mouse"
    return if prevent
    TweenLite.to line1, .2, y: 0, transformOrigin: "50% 50%"
    TweenLite.to line3, .2, y: 0, transformOrigin: "50% 50%"

  'click #display-menu': (e)->
    if(!$("#display-menu").hasClass("cross"))
      prevent     = no
      reversed    = no
      btn         = $ '#display-menu'
      
      line1       = $ ".svg--burger .line-1"
      line2       = $ ".svg--burger .line-2"
      line3       = $ ".svg--burger .line-3"
      line4       = $ ".svg--burger .line-4"
      
      li          = $ ".container-menu nav ul li" 
      logOut      = $ ".log-out"
      burger      = $ ".container-menu nav ul .burger"
      burgerH2    = $ ".container-menu nav ul .burger .log-out .log-out__text h3"
      burgerAHREF = $ ".container-menu nav ul .burger .log-out .log-out__text a"
      SVGburger   = $ ".svg--burger"

      TweenLite.set line4, transform: "rotate(90deg)"
      TweenLite.set burgerH2, autoAlpha: 0
      TweenLite.set burgerAHREF, autoAlpha: 0
      TweenLite.set logOut, width: 0

      t = 0
      lines = r: 0
      TweenLite.to line1, .2, y: 11, transformOrigin: "50% 50%", delay: t
      TweenLite.to line3, .2, y: -11, transformOrigin: "50% 50%", delay: t
      TweenLite.set [line1, line3], opacity: 0, delay: t+=.2
      TweenLite.to lines, .3, 
        r: 45, 
        onUpdate: ->
          TweenLite.set line2, 
            transform: "rotate(#{lines.r}deg)", 
            transformOrigin: "50% 50%"

          TweenLite.set line4, 
            transform: "rotate(#{lines.r+90}deg)", 
            transformOrigin: "50% 50%", 
            opacity: lines.r/45
          return
        ease: Sine.easeInOut, 
        delay: t

      TweenLite.to li, .2, width: "192px", delay: t
      TweenLite.to burger, .2, width: "25%", delay: t+=.5
      TweenLite.to SVGburger, .2, margin: "0", delay: t
      TweenLite.to logOut, .2, className: "-=hide", delay: t+=.2
      TweenLite.to logOut, .2, width: "calc(100% - 25px)", delay: t
      TweenLite.to burgerH2, .2, autoAlpha: 1, delay: t
      TweenLite.to burgerAHREF, .2, autoAlpha: 1, delay: t

      $("#display-menu").addClass("cross")
      return
    
  'click .cross': (e)->
    prevent   = no
    reversed  = no
    btn       = $ '#display-menu'
    line1     = $ ".svg--burger .line-1"
    line2     = $ ".svg--burger .line-2"
    line3     = $ ".svg--burger .line-3"
    line4     = $ ".svg--burger .line-4"
    
    SVGburger = $ ".svg--burger"
    burger    = $ ".container-menu nav ul .burger"
    li        = $ ".container-menu nav ul li"
    logOut    = $ ".log-out"

    TweenLite.set line4, transform: "rotate(90deg)"
    if($("#display-menu").hasClass("cross"))
      TweenLite.set line4, transform: "rotate(90deg)"
      TweenLite.set [line1, line3], clearProps: "stroke"

      t = 0
      lines = r: 45
      TweenLite.to lines, .3, 
      r: 0, 
      onUpdate: ->
        TweenLite.set line2, 
          transform: "rotate(#{lines.r}deg)", 
          transformOrigin: "50% 50%"

        TweenLite.set line4, 
          transform: "rotate(#{lines.r+90}deg)", 
          transformOrigin: "50% 50%", 
          opacity: lines.r/45
        return
      ease: Sine.easeInOut, 
      delay: t
      
      TweenLite.set [line1, line3], opacity: 1, delay: t+=.3
      TweenLite.to logOut, .2, className: "+=hide", delay: t
      TweenLite.to [line1, line3], .2, y: 0, transformOrigin: "50% 50%", delay: t
      TweenLite.to li, .2, width: "240px", delay: t
      TweenLite.to burger, .2, width: "30px", delay: t
      TweenLite.to SVGburger, .2, margin: "0px 0px 0px 20px", delay: t
      $("#display-menu").removeClass("cross")
      return

