Template.oups.rendered = ->
  t2 = 3
  tm2 = new TimelineMax paused: true

  h2 = $ ".container-oups h2"
  h3 = $ ".container-oups h3"
  img = $ ".container-oups img"

  TweenMax.set h2, autoAlpha: 0, y: 50
  TweenMax.set h3, autoAlpha: 0, y: 50
  TweenMax.set img, autoAlpha: 0

  tm2.to( h2, 2, {autoAlpha: 1, y: 0, ease: Back.easeOut}, t2+=.5)
  tm2.to( h3, 2, {autoAlpha: 1, y: 0, ease: Back.easeOut}, t2+=.1)
  tm2.to( img, 2, {autoAlpha: 1,  ease: Back.easeOut}, t2+=.1)

  tm2.play()