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

  form = $ ".container-login form"
  img = $ ".container-login form img"
  p = $ ".container-login form p"
  input = $ ".container-login form input"
  ahref = $ ".container-login a"

  TweenMax.set [form,img,p,input,ahref], autoAlpha: 0
  TweenMax.set form, scale: 0

  timeline.to( form, 1, {autoAlpha: 1, scale: 1,ease: Ease.easeOut}, delay+=1)
  timeline.to( [img,p,input,ahref], 0, {autoAlpha: 0,ease: Ease.easeOut}, delay+=1)
  timeline.to( [img,p,input,ahref], .5, {autoAlpha: 1,ease: Ease.easeOut}, delay)
  


  timeline.play()
