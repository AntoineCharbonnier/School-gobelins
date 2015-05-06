Template.app.events 
  'click #logout': (e) ->
    currentUser = Meteor.user()
    Meteor.users.update { _id: currentUser._id }, $set: 'profile.connected': false
    Meteor.logout()
    return
