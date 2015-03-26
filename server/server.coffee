Meteor.startup ->
  #Exercices.remove {}
  # Meteor.users.remove {}
  
  #Exercices.insert
  #  number: Exercices.find().count() + 1
  #  question: 'Divises 35 par 7.'
  #  answers:
  #    right: 5
  #    wrong: []
  
  #console.log 'Insert one : ', Exercices.find().fetch()
  
  #Exercices.insert
  #  number: Exercices.find().count() + 1
  #  question: 'Combien fait 2 + 2 ?'
  #  answers:
  #    right: 4
  #    wrong: [
  #      6
  #      22
  #    ]
  
  #console.log Exercices.find().count()
  #console.log 'Insert two : ', Exercices.find().fetch()
  
  #Accounts.createUser
  # username: 'titi'
  # email: 'titi@gmail.com'
  # password: 'titi'
  # profile: account: 'teacher'
  
  #Accounts.createUser
  # username: 'eleve'
  # email: 'eleve@gmail.com'
  # password: 'eleve'
  # profile:
  #   account: 'student'
  #   connected: false
  #   currentExercice: null
  #   answers: []
  
  Meteor.users.allow update: (userId, docs, fields, modifier) ->
    true
  return