Template.login.events 'submit form': (e) ->
  e.preventDefault()
  data = $(e.target).serializeJSON()
  Meteor.loginWithPassword data.email, data.password, (err) ->
    if !err
      console.log 'Login successfully'
    else
      console.log 'Error attempting to log in : ', err
      # ADD TOGGLE ANIMATION
      t = 0
      login = $ ".container-login form"

      tm = new TimelineMax paused: true
      tm.to( login, .1, {x:-5},t+=.1)
      tm.to( login, .1, {x:5},t+=.1)
      tm.to( login, .1, {x:-5},t+=.1)
      tm.to( login, .1, {x:5},t+=.1)
      tm.to( login, .1, {x:0},t+=.1)

      tm.play()

      $("#login-mail").val("")
      $("#login-password").val("")
    return
  false