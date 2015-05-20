Template.login.rendered = ->
  delay = 0
  timeline = new TimelineMax paused: true

  container = $ ".container-login"
  TweenMax.set container, className:"-=hide"
  # li_img = $ ".container-login ul li"
  # li_h3 = $ ".container-login ul li h3"
  # background_circle = $ ".container-login ul .background--circle"

  # TweenMax.set [li_h3,background_circle], autoAlpha: 0
  # TweenMax.set background_circle, scale: 0

  form   = $ ".container-login form"
  img    = $ ".container-login form img"
  p      = $ ".container-login form p"
  input  = $ ".container-login form input"
  ahref  = $ ".container-login a"
  logger = $ ".container-login form #logger"

  TweenMax.set [form,img,p,input,ahref,logger], autoAlpha: 0
  TweenMax.set form, scale: 0
  TweenMax.set logger, width: 0,height: 0, margin: "40px 25px 0 0"

  timeline.to( form, .5, {autoAlpha: 1, scale: 1,ease: Ease.easeOut}, delay+=.5)
  timeline.to( [img,p,input,ahref,logger], 0, {autoAlpha: 0,ease: Ease.easeOut}, delay+=.5)
  timeline.to( [img,p,input,ahref,logger], .5, {autoAlpha: 1,ease: Ease.easeOut}, delay+=.5)
  timeline.to( logger, .5, {width: "90px",height: "2px",ease: Ease.easeOut}, delay+=1)
  timeline.to( logger, .5, {height: "35px",margin: "25px 25px 0 0",ease: Ease.easeOut}, delay+=1)

  


  timeline.play()
