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






    # mySplitTextH4 = new SplitText(@h4, {type:"words,chars"})
    # charsH4 = mySplitTextH4.chars

    # mySplitTextH2 = new SplitText(@h2, {type:"words,chars"})
    # charsH2 = mySplitTextH2.chars

    # # mySplitTextH1 = new SplitText(@h1, {type:"words,chars"})
    # # charsH1 = mySplitTextH1.chars  
    # @tm.to(@h1, 1,autoAlpha: 1, scrambleText:{text:"transiliens", chars:"Come on boy !", revealDelay:0.5, tweenLength:false, ease:Linear.easeNone},t+=.3)

    # @tm.to( @container, 1.5,{autoAlpha: 1, ease: Ease.easeIn}, t+=.2)
    # @tm.to( @img, 1,{autoAlpha: 1,x: 0, ease: Ease.easeIn}, t+=.2)#,scale: 1
    # @tm.staggerFrom(charsH4, 0.8,opacity: 0,scale: 0,y: 80,rotationX: 180,transformOrigin: "0% 50% -50",ease: Back.easeOut, 0.01, t+=.8)
    # @tm.staggerFrom(charsH2, 0.8,opacity: 0,scale: 0,y: 80,rotationX: 180,transformOrigin: "0% -50% 50",ease: Back.easeOut, 0.01, t+=.8)
