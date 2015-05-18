Template.oups.rendered = ->
  t2 = 2
  tm2 = new TimelineMax paused: true

  h2 = $ ".container-oups h2"
  h3 = $ ".container-oups h3"
  img = $ ".container-oups img#oups"

  TweenMax.set h2, autoAlpha: 0, y: 50
  TweenMax.set h3, autoAlpha: 0, y: 50
  TweenMax.set img, autoAlpha: 0, y: 100, scale: 0


  tm2.to( img, 8, {scale: 1, autoAlpha: 1,ease: Ease.easeIn}, t2+=1)
  
  i= 0
  while i < 20
    tm2.to( img, .1, {autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.1)
    tm2.to( img, .1, { autoAlpha: 1,ease: Ease.easeIn}, t2+=.1)
    i++

  tm2.to( img, 8,{y:0, ease: Ease.easeIn},t2+=.1)
  
  j = 0
  while j < 10
    tm2.to( img, .1, { autoAlpha: 1,ease: Ease.easeIn}, t2+=.1)
    tm2.to( img, .1, {autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.1)
    j++

  k = 0
  while k < 10
    tm2.to( img, .2, { autoAlpha: 1,ease: Ease.easeIn}, t2+=.2)
    tm2.to( img, .2, {autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.2)
    k++    

  tm2.to( img, .2, { autoAlpha: 1,ease: Ease.easeIn}, t2+=.2)

  tm2.to( h2, 2, {autoAlpha: 1, y: 0, ease: Back.easeOut}, t2+=.2)
  tm2.to( h3, 2, {autoAlpha: 1, y: 0, ease: Back.easeOut}, t2+=.1)
  
  tm2.play()

  # tm = new TimelineMax paused: true
  # t = 0
  # i = 0
  # stars = ".stars img"
  # # tm.staggerTo(stars, .2, {autoAlpha: 0, ease: Back.easeOut}, .4)

  # # tm.play()
  # TweenMax.staggerTo(stars, 0.1, {opacity:0, ease:Back.easeIn}, 0.4);