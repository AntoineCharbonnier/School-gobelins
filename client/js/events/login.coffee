Template.login.events 'submit form': (e) ->
  e.preventDefault()
  data = $(e.target).serializeJSON()
  Meteor.loginWithPassword data.email, data.password, (err) ->
    if !err
      console.log 'Login successfully'
    else
      console.log 'Error attempting to log in : ', err
      # ADD TOGGLE ANIMATION
    return
  false