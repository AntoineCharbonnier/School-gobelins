Template.data.events
  'click #create-groups': (e) ->

    users = Meteor.users.find({
    "profile.account": "student"
    }, {sort: { "profile.currentExercice": -1, username: 1} }).fetch()

    # console.log("USERS : ",users)


    ## LEAD USER
    # i = 0
    # while i < 6
    #   # newGroup = []
    #   groupNumber = "group#{i+1}"
    #   console.log "groupNumber : ",groupNumber
    #   groups = Groups.find({ name: groupNumber }).fetch()
    #   if(groups[0].users)
    #     newGroup = groups[0].users
      
    #   # else
    #   #   newGroup = []
      
    #   # newGroup = groups.users
    #   newGroup.push(users[i])
    #   console.log "NEW GROUP : ",newGroup
    #   Groups.update { _id: groups._id }, $set: "users": newGroup

    #   i++


    # # RANDOM USER
    # j = 6
    # while j < 24
    #   # console.log "j = 0, j < 18, j%3 = #{j%6}"
    #   # newGroup2 = []
    #   groupNumber = "group#{(j%6)+1}"
    #   # console.log "NEXTgroupNumber : ",groupNumber
    #   groups2 = Groups.find({ name: groupNumber }).fetch()
    #   if groupNumber == "group2"
    #     console.log "groups2 : ",groups2[0]
      
    #   if(groups2[0].users)
    #     newGroup2 = groups2[0].users
      
    #   # else
    #   #   newGroup2 = []
      
    #   newGroup2.push(users[j])
    #   # console.log 
    #   # console.log "GROUPS TOTAL : ", groups2
    #   Groups.update { _id: groups2._id }, $set: "users": newGroup2

    #   j++



    # i = 0
    # while i < users.length
    #   # newGroup = []
    #   console.log "___________________________"
    #   groupNumber = "group#{(i%6)+1}"
    #   console.log "groupNumber : ",groupNumber
    #   groups = Groups.find({ name: groupNumber }).fetch()
    #   if(groups[0].users)
    #     newGroup = groups[0]

    #   # else
    #   #   newGroup = []
      
    #   # newGroup = groups.users
    #   console.log "NEW GROUP : ",newGroup
    #   newGroup.users.push(users[i])
    #   console.log "NEW GROUP : ",newGroup
    #   Groups.update { _id: groups._id }, $set: "users": newGroup
    #   console.log "___________________________"

    #   i++


    # groups = Groups.find({ name: "group1" }).fetch()



    # console.log " Group ",groupStudents
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
    # Groups.update { _id: groups._id }, $set: {user1 :  group1[].username}


    console.log "LEs GROUPEs : ", Groups.find().fetch()
    # Router.go('/groups')
    # Router.go "/groups" 

    appEvents = AppEvents.findOne(name: 'displayer')
    AppEvents.update { 
      _id: appEvents._id 
      }, 
      $set: {
        "module": "display-group"
      }
    console.log "DISPLAYER", AppEvents.findOne(name: 'displayer')
    
    return
