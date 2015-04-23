Meteor.startup ->

  # ############################################ 
  # ### RESETS
  # ############################################ 

  # Exercices.remove {}
  # Meteor.users.remove {}
  # AppEvents.remove {}
  
  # ############################################ 
  # ### EVENTS
  # ############################################ 

  # AppEvents.insert
  #   name: "indexClasses"
  #   indexClasses: 0

  # AppEvents.insert
  #   name: "displayer"
  #   module: ""

  # ############################################ 
  # ### EXERCICES
  # ############################################ 

  # Exercices.insert
  #  number: Exercices.find().count() + 1
  #  question: 'Divises 37 par 7.'
  #  dividend: 37
  #  denominator: 7
  #  isAssisted: true
  #  validated: false
  #  level: "medium"
  #  answers:
  #    right: 5
  #    wrong: []

  
  # console.log 'Insert one : ', Exercices.find().fetch()
  
  # Exercices.insert
  #  number: Exercices.find().count() + 1
  #  question: 'Combien fait 2 + 2 ?'
  #  validated: false
  #  level: "easy"
  #  answers:
  #    right: 4
  #    wrong: [
  #      6
  #      22
  #    ]
  
  # Exercices.insert
  #  number: Exercices.find().count() + 1
  #  question: 'Divises 259 par 7.'
  #  dividend: 259
  #  denominator: 7
  #  isAssisted: true
  #  validated: false
  #  level: "hard"
  #  answers:
  #    right: 37
  #    wrong: []

  # console.log Exercices.find().count()
  # console.log 'Insert two : ', Exercices.find().fetch()
  
  # ############################################ 
  # ### ACCOUNTS
  # ############################################ 

  # Accounts.createUser
  #  username: 'titi'
  #  email: 'titi@gmail.com'
  #  password: 'titi'
  #  profile: account: 'teacher'
  
  # Accounts.createUser
  #  username: 'eleve'
  #  email: 'eleve@gmail.com'
  #  password: 'eleve'
  #  profile:
  #    account: 'student'
  #    connected: false
  #    currentExercice: null
  #    answers: []

  # Accounts.createUser
  #  username: 'popoch'
  #  email: 'popoch@gmail.com'
  #  password: 'popoch'
  #  profile:
  #    account: 'student'
  #    connected: true
  #    currentExercice: null
  #    answers: []

  # Accounts.createUser
  #  username: 'eleve2'
  #  email: 'eleve2@gmail.com'
  #  password: 'eleve2'
  #  profile:
  #    account: 'student'
  #    connected: true
  #    currentExercice: null
  #    answers: []





  AppEvents.allow update: (userId, docs, fields, modifier) ->
    return true
  Meteor.users.allow update: (userId, docs, fields, modifier) ->
   return true