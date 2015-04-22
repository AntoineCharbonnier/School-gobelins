Template.classesShow.rendered = ->
  # Meteor.defer = ->
  container = ".container-classes-show"
  # console.log("RENDERED")

  TweenMax.set container, autoAlpha: 0
  # show()
  t = 1
  tm = new TimelineMax paused: true#, repeat: -1, yoyo: true, repeatDelay: 3.0
  tm.to( container, 5.5,{autoAlpha: 1, ease: Ease.easeIn}, t+=.50)
  tm.play()

# NOT YET
Template.classesShow.destroyed = ->
  # self = this
  # self.preventDefault()
  container = ".container-classes-show"
  # console.log("DESTROYED")
  # TweenMax.set container, autoAlpha: 0
  # show()
  t = 1
  tm = new TimelineMax paused: true#, repeat: -1, yoyo: true, repeatDelay: 3.0
  tm.to( container, 5.5,{autoAlpha: 0, ease: Ease.easeIn}, t+=.50)
  tm.play()
  # self.destroy()