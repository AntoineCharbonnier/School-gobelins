Template.oups.rendered = ->
  t2 = 3
  tm2 = new TimelineMax paused: true

  h2 = $ ".container-oups h2"
  h3 = $ ".container-oups h3"
  img = $ ".container-oups img#oups"

  TweenMax.set h2, autoAlpha: 0, y: 50
  TweenMax.set h3, autoAlpha: 0, y: 50
  TweenMax.set img, autoAlpha: 0, y: 100


  tm2.to( img, 2, {y: 0,ease: Ease.easeIn}, t2+=.1)
  tm2.to( img, .2, {scale: 0.8, autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 1, autoAlpha: 1,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 0.8, autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 1, autoAlpha: 1,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 0.8, autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 1, autoAlpha: 1,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 0.8, autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 1, autoAlpha: 1,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 0.8, autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 1, autoAlpha: 1,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 0.8, autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 1, autoAlpha: 1,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 0.8, autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 1, autoAlpha: 1,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 0.8, autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 1, autoAlpha: 1,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 0.8, autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 1, autoAlpha: 1,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 0.8, autoAlpha: 0.5,ease: Ease.easeIn}, t2+=.2)
  tm2.to( img, .2, {scale: 1, autoAlpha: 1,ease: Ease.easeIn}, t2+=.2)

  tm2.to( h2, 2, {autoAlpha: 1, y: 0, ease: Back.easeOut}, t2+=.2)
  tm2.to( h3, 2, {autoAlpha: 1, y: 0, ease: Back.easeOut}, t2+=.1)
  
  # tm2.to( img, 2, {autoAlpha: 1, y: 0, ease: Back.easeOut}, t2+=.1)
  tm2.play()