Template.sendExercices.rendered = ->
  users = Meteor.users.find().fetch()



  delay = 0
  timeline = new TimelineMax paused: true
  settersLI = new TimelineMax paused: true

  container = $ ".container-send-exercices"
  li_img = $ ".container-send-exercices ul li img"
  li_h6 = $ ".container-send-exercices ul li h6"
  select_zone = $ ".container-send-exercices .select-zone"


  middleX = container.width()/2
  middleY = container.height()/2


  # console.log "X #{middleX}  Y #{middleY}"

  TweenMax.set [li_h6,select_zone], autoAlpha: 0

  setTimeout ()=>
    li_img.each (index)->
      TweenMax.set $(this)[0],autoAlpha: 0, x: middleX-$(this)[0].getBoundingClientRect().left, y: middleY-$(this)[0].getBoundingClientRect().top
      timeline.to( $(this)[0], 2, {autoAlpha: 1, x: middleX-$(this)[0].getBoundingClientRect().left, y: middleY-$(this)[0].getBoundingClientRect().top,ease: Back.easeOut}, delay)
    delay+=.5
    timeline.to( li_h6, 2, {autoAlpha: 1,ease: Back.easeOut}, delay+=.5)
    timeline.to( select_zone, 2, {autoAlpha: 1,ease: Back.easeOut}, delay+=.5)

    i = 0
    while i < users.length
      if(users[i].profile.connected)
        image_name = users[i].username.replace(/\s/g,"_")
        avatar = $ "#avatar-#{image_name}"
        avatar_overlay = $ "#avatar-#{image_name}-overlay"

      #   # t = 0
      #   # tm = new TimelineMax paused: true
        timeline.to(avatar_overlay, 1, {autoAlpha: 0,transformOrigin:"50% 50%",scale: 0,ease: Ease.easeIn}, delay+= .1)
        timeline.to( avatar, 1, {className:"-=is-missing", ease: Ease.easeIn}, delay+=.1)
      #   timeline.to( avatar, 0.5, {height:"65px", width:"65px", ease: Back.easeOut}, delay+=.1)
      #   timeline.to( avatar, 0.5, {height:"70px", width:"70px", ease: Back.easeOut}, delay+=.5)
      #   timeline.to( avatar, 0.5, {height:"65px", width:"65px", ease: Back.easeOut}, delay+=.1)
      #   timeline.to( avatar, 0.5, {height:"70px", width:"70px", ease: Back.easeOut}, delay+=.5)
      #   timeline.to( avatar, 0.1, {height:"74px", width:"74px", ease: Back.easeOut}, delay+=.1)
      #   timeline.to( avatar, 0.4, {autoAlpha: 0.3, ease: Back.easeOut}, t+=.5)
      #   # timeline.play()

      # else
      #   image_name = users[i].username.replace(/\s/g,"_")
      #   avatarPointConnected = $ "#avatar-#{image_name}-connected"
      #   # t2 = 0
      #   # tm2 = new TimelineMax paused: true
        
      #   timeline.to( avatarPointConnected, 0.5, {height:"5px", width:"5px", ease: Back.easeOut}, delay+=.1)
      #   timeline.to( avatarPointConnected, 0.5, {height:"10px", width:"10px", ease: Back.easeOut}, delay+=.5)
      #   timeline.to( avatarPointConnected, 0.5, {height:"5px", width:"5px", ease: Back.easeOut}, delay+=.1)
      #   timeline.to( avatarPointConnected, 0.5, {height:"10px", width:"10px", ease: Back.easeOut}, delay+=.5)
      #   timeline.to( avatarPointConnected, 0.1, {height:"12px", width:"12px", ease: Back.easeOut}, delay+=.5)
      #   # tm2.play()

      i++
  , 1000
  timeline.play()











