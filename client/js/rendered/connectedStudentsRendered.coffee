Template.connectedStudents.rendered = ->
  users = Meteor.users.find().fetch()
  i = 0
  while i < users.length
    if(!users[i].profile.connected)
      image_name = users[i].username.replace(/\s/g,"_")
      avatar = $ "#avatar-#{image_name}"
      t = 0
      tm = new TimelineMax paused: true

      tm.to( avatar, 2, {className:"is-missing", ease: Ease.easeIn}, t+=.1)
      tm.to( avatar, 0.5, {height:"65px", width:"65px", ease: Back.easeOut}, t+=.1)
      tm.to( avatar, 0.5, {height:"70px", width:"70px", ease: Back.easeOut}, t+=.5)
      tm.to( avatar, 0.5, {height:"65px", width:"65px", ease: Back.easeOut}, t+=.1)
      tm.to( avatar, 0.5, {height:"70px", width:"70px", ease: Back.easeOut}, t+=.5)
      tm.to( avatar, 0.1, {height:"74px", width:"74px", ease: Back.easeOut}, t+=.1)
      tm.to( avatar, 0.4, {autoAlpha: 0.3, ease: Back.easeOut}, t+=.5)
      tm.play()

    else
      image_name = users[i].username.replace(/\s/g,"_")
      avatarPointConnected = $ "#avatar-#{image_name}-connected"
      t2 = 0
      tm2 = new TimelineMax paused: true
      
      tm2.to( avatarPointConnected, 0.5, {height:"5px", width:"5px", ease: Back.easeOut}, t2+=.1)
      tm2.to( avatarPointConnected, 0.5, {height:"10px", width:"10px", ease: Back.easeOut}, t2+=.5)
      tm2.to( avatarPointConnected, 0.5, {height:"5px", width:"5px", ease: Back.easeOut}, t2+=.1)
      tm2.to( avatarPointConnected, 0.5, {height:"10px", width:"10px", ease: Back.easeOut}, t2+=.5)
      tm2.to( avatarPointConnected, 0.1, {height:"12px", width:"12px", ease: Back.easeOut}, t2+=.5)
      tm2.play()

    i++