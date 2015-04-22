Template.exercices.rendered = ->
  # Meteor.defer = ->
  container = ".container-exerice"
  console.log("RENDERED EX")

  TweenMax.set container, autoAlpha: 0
  # show()
  t = 1
  tm = new TimelineMax paused: true#, repeat: -1, yoyo: true, repeatDelay: 3.0
  tm.to( container, 5.5,{autoAlpha: 1, ease: Ease.easeIn}, t+=.50)
  tm.play()

# NOT YET
Template.exercices.destroyed = ->
  # self = this
  # self.preventDefault()
  container = ".container-classes-show"
  console.log("DESTROYED EX")
  # TweenMax.set container, autoAlpha: 0
  # show()
  t = 1
  tm = new TimelineMax paused: true#, repeat: -1, yoyo: true, repeatDelay: 3.0
  tm.to( container, 5.5,{autoAlpha: 0, ease: Ease.easeIn}, t+=.50)
  tm.play()
  # self.destroy()


Template.exercices.beforeDestroyed = ->
  # self = this
  # self.preventDefault()
  console.log "try destroy EX"
  # doSomeAnimation().andThen(function() { self.destroy(); });
