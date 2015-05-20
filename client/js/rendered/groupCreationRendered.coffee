Template.groupCreation.rendered = ->
  delay = 0
  timeline = new TimelineMax paused: true

  container = $ ".container-group-creation"
  TweenMax.set container, className:"-=hide"
  li_img = $ ".container-group-creation ul li"
  li_h3 = $ ".container-group-creation ul li h3"
  background_circle = $ ".container-group-creation ul .background--circle"

  TweenMax.set [li_h3,background_circle], autoAlpha: 0
  TweenMax.set background_circle, scale: 0

  setTimeout ()=>
    index = 0
    while index < 7
      ul  = $ ".container-group-creation ul.group#{index}"
      li_children = $ ".container-group-creation ul.group#{index} li"  
      ul.each (index)->
        li_children.each (index2)->
          if(index2+1 == 1)
            TweenMax.set $(this)[0],autoAlpha: 0, scale: 0, x: 67, y: 67
          if(index2+1 == 2)
            TweenMax.set $(this)[0],autoAlpha: 0, scale: 0, x: -67, y: 67  
          if(index2+1 == 3)
            TweenMax.set $(this)[0],autoAlpha: 0, scale: 0, x: 67, y: -67
          if(index2+1 == 4)
            TweenMax.set $(this)[0],autoAlpha: 0, scale: 0, x: -67, y: -67
      index++
    timeline.to( li_img, 1, {autoAlpha: 1, scale: .5,ease: Ease.easeOut}, delay+=1)

    timeline.to( li_img, 2, {scale: 1, x: 0, y: 0,ease: Ease.easeOut}, delay+=1)
    timeline.to( background_circle, 1, {autoAlpha: 1, scale: 1,ease: Ease.easeOut}, delay+=1)

    timeline.to( li_h3, 1, {autoAlpha: 1, ease: Ease.easeOut}, delay+=1)

  , 1000
  timeline.play()
