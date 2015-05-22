Template.globalVision.gestures 
  'panleft .container-global-vision': (event,template) ->
    return
  
  'press .avatar__selector': (event,template) ->
    console.log "press"
    id = event.target.dataset.id
    image = event.target
    svg = "a#"+id+" .circlue_cut_global"
    
    user = Meteor.users.find(
      '_id': id 
      )
      .fetch()

    student = user[0]
    currentEx = 0
    i = 0
    while i < student.profile.answers.length
      if currentEx < student.profile.answers[i].currentEx
        currentEx = student.profile.answers[i].currentEx
      i++
    exercicesNumber = Exercices.find().fetch().length

    progressPX = (parseInt(currentEx / exercicesNumber * 100))*390/100

    timeline = new TimelineMax paused: true
    timeline.to(image, 1, {scale: 1.5, autoAlpha: 1.5, ease: Ease.easeIn}, t+= 0.1);
    timeline.to(image, 1, {scale: 1.5, autoAlpha: 1.5, ease: Ease.easeIn}, t+= 0.1);
    timeline.to(svg, 1, {strokeDasharray: "#{progressPX}px, 500px", ease: Ease.easeIn}, t+= 0.1);

    timeline.play()
    return

  'pressup .avatar__selector': (event,template) ->
    console.log "end"
    event.preventDefault()
    popup = $ ".container-global-vision .pop-up"

    TweenMax.set popup, autoAlpha: 0, className: "+=hide"

    id = event.target.dataset.id
    image = event.target
    svg = "a#"+id+" .circlue_cut_global"

    timeline = new TimelineMax paused: true
    timeline.to(svg, 1, {strokeDasharray: "0px, 500px", ease: Ease.easeIn}, t+= 0.1);
    timeline.to(image, 1, {scale: 1, autoAlpha: 1, ease: Ease.easeIn}, t+= 0.1);    
    timeline.play()

    return
