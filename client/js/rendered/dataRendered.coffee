Template.data.rendered = ->
  delay = 0
  timeline = new TimelineMax paused: true

  container = $ ".container-data"
  
  summary_h2 = $ ".container-data .summary h2"
  summary_h4 = $ ".container-data .summary h4"
  summary_h5 = $ ".container-data .summary h5"
  summary_circle = $ ".container-data .summary .circle"
  summary_separator = $ ".container-data .summary .separator"
  summary_time = $ ".container-data .summary .time"
  summary_attemps = $ ".container-data .summary .attemps"
  summary_buttons = $ ".container-data .summary .buttons"

  students_li = $ ".container-data .students ul li"



  # TweenMax.set container, className:"-=hide"
  # li_img = $ ".container-data ul li"
  # li_h3 = $ ".container-data ul li h3"
  # background_circle = $ ".container-data ul .background--circle"

  TweenMax.set [summary_h2,summary_h4,summary_h5,summary_circle,summary_separator,summary_time,summary_attemps,summary_buttons,students_li], autoAlpha: 0
  TweenMax.set students_li, y: 1000


  timeline.to( [summary_h2,summary_h4], .5, {autoAlpha: 1,ease: Ease.easeOut}, delay+=.5)
  timeline.to( summary_circle, .5, {autoAlpha: 1,ease: Ease.easeOut}, delay+=.5)
  timeline.to( summary_h5, .5, {autoAlpha: 1,ease: Ease.easeOut}, delay+=.5)
  timeline.to( summary_separator, .5, {autoAlpha: 1,ease: Ease.easeOut}, delay+=.5)
  timeline.to( [summary_time,summary_attemps], .5, {autoAlpha: 1,ease: Ease.easeOut}, delay+=.5)
  timeline.to( summary_buttons, .5, {autoAlpha: 1,ease: Ease.easeOut}, delay+=.5)
  
  timeline.staggerTo(students_li, 1.3, {autoAlpha: 1,y:0, ease: Ease.easeOut}, .1)



  timeline.play()
