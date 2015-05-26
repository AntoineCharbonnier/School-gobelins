Template.waiting.rendered = ->
  t2 = 2
  tm2 = new TimelineMax paused: true

  container = $ ".container-waiting"
  background = $ ".container-waiting .background"
  h1 = $ ".container-waiting .doodle h1"
  img = $ ".container-waiting .doodle img"
  p = $ ".container-waiting .doodle p"
  h3 = $ ".container-waiting .doodle h3"

  TweenMax.set container, autoAlpha: 0
  TweenMax.set [img,h1,p,h3], autoAlpha: 0, y: 300

  tm2.to( container, .5, {autoAlpha: 1,ease: Ease.easeIn}, t2+=.5)
  tm2.to( [h1,p,h3], .1, {autoAlpha: 0,ease: Ease.easeIn}, t2+=.1)
  tm2.to( img, .8, {autoAlpha: 1,y: 0,ease: Back.easeOut}, t2+=.6)
  tm2.to( h1, .8, {autoAlpha: 1,y: 0,ease: Back.easeOut}, t2+=.6)
  tm2.to( p, .8, {autoAlpha: 1,y: 0,ease: Back.easeOut}, t2+=.6)
  tm2.to( h3, .8, {autoAlpha: 1,y: 0,ease: Back.easeOut}, t2+=.6)
  
  tm2.play()



