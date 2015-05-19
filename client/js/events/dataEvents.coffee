Template.data.events
  'click #create-groups': (e) ->
    users = Meteor.users.find({
    "profile.account": "student"
    }, {sort: { "profile.currentExercice": -1, username: 1} }).fetch()

    i = 0
    l = 1
    while i < users.length
      groupStudents = []
      groupStudents.push(users[i])
      groupStudents.push(users[i + 1])
      groupStudents.push(users[i + 2])
      groupStudents.push(users[i + 3])

      Groups.insert
        name: "group#{l}"
        user1: groupStudents[0]
        user2: groupStudents[1]
        user3: groupStudents[2]
        user4: groupStudents[3]
      l++
      i = i + 4

    console.log "LEs GROUPEs : ", Groups.find().fetch()

    appEvents = AppEvents.findOne(name: 'displayer')
    AppEvents.update { 
      _id: appEvents._id 
      }, 
      $set: {
        "module": "display-group"
      }
    console.log "DISPLAYER", AppEvents.findOne(name: 'displayer')
    
    return
