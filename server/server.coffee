# Meteor.startup ->

#   ############################################ 
#   ### RESETS
#   ############################################ 

#   Exercices.remove {}
#   Meteor.users.remove {}
#   AppEvents.remove {}
  
#   ############################################ 
#   ### EVENTS
#   ############################################ 

#   AppEvents.insert
#     name: "indexClasses"
#     indexClasses: 0

#   AppEvents.insert
#     name: "displayer"
#     module: ""

#   ############################################ 
#   ### EXERCICES
#   ############################################ 

#   Exercices.insert
#    number: Exercices.find().count() + 1
#    question: 'Divises 37 par 7.'
#    dividend: 37
#    denominator: 7
#    isAssisted: true
#    validated: false
#    level: "medium"
#    answers:
#      right: 5
#      wrong: []

  
#   console.log 'Insert one : ', Exercices.find().fetch()
  
#   Exercices.insert
#    number: Exercices.find().count() + 1
#    question: 'Combien fait 2 + 2 ?'
#    validated: false
#    level: "easy"
#    answers:
#      right: 4
#      wrong: [
#        6
#        22
#      ]
  
#   Exercices.insert
#    number: Exercices.find().count() + 1
#    question: 'Divises 259 par 7.'
#    dividend: 259
#    denominator: 7
#    isAssisted: true
#    validated: false
#    level: "hard"
#    answers:
#      right: 37
#      wrong: []

#   console.log Exercices.find().count()
#   console.log 'Insert two : ', Exercices.find().fetch()
  
#   ############################################ 
#   ### ACCOUNTS TEACHER
#   ############################################ 

#   Accounts.createUser
#    username: 'Philippe Neveu'
#    email: 'PhilippeNeveu@gmail.com'
#    password: 'PhilippeNeveu'
#    profile: account: 'teacher'
  

#   ############################################ 
#   ### ACCOUNTS STUDENTS
#   ############################################ 
  

#   Accounts.createUser
#    username: 'Abla Louna'
#    email: 'AblaLouna@gmail.com'
#    password: 'AblaLouna'
#    profile:
#      account: 'student'
#      connected: false
#      currentExercice: null
#      answers: []

#   Accounts.createUser
#    username: 'Begidis Alban'
#    email: 'BegidisAlban@gmail.com'
#    password: 'BegidisAlban'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []

#   Accounts.createUser
#    username: 'Bihannic Etienne'
#    email: 'BihannicEtienne@gmail.com'
#    password: 'BihannicEtienne'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []

#   Accounts.createUser
#    username: 'Bouffier Anna'
#    email: 'BouffierAnna@gmail.com'
#    password: 'BouffierAnna'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []

#   Accounts.createUser
#    username: 'Canitrot Maud'
#    email: 'CanitrotMaud@gmail.com'
#    password: 'CanitrotMaud'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Chen Villon'
#    email: 'ChenVillon@gmail.com'
#    password: 'ChenVillon'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Corbeau Lilian'
#    email: 'CorbeauLilian@gmail.com'
#    password: 'CorbeauLilian'
#    profile:
#      account: 'student'
#      connected: false
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Cortez Benjamin'
#    email: 'CortezBenjamin@gmail.com'
#    password: 'CortezBenjamin'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Denchin Amalthee'
#    email: 'DenchinAmalthee@gmail.com'
#    password: 'DenchinAmalthee'
#    profile:
#      account: 'student'
#      connected: false
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Etienne Marzhin'
#    email: 'EtienneMarzhin@gmail.com'
#    password: 'EtienneMarzhin'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Jebabli Ayat'
#    email: 'JebabliAyat@gmail.com'
#    password: 'JebabliAyat'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Many Moutou'
#    email: 'ManyMoutou@gmail.com'
#    password: 'ManyMoutou'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Mendez Roxanne'
#    email: 'MendezRoxanne@gmail.com'
#    password: 'MendezRoxanne'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Metteni William'
#    email: 'MetteniWilliam@gmail.com'
#    password: 'MetteniWilliam'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Osti Maxime'
#    email: 'OstiMaxime@gmail.com'
#    password: 'OstiMaxime'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Pepas Margot'
#    email: 'PepasMargot@gmail.com'
#    password: 'PepasMargot'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Ponsardin Hugo'
#    email: 'PonsardinHugo@gmail.com'
#    password: 'PonsardinHugo'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Raissac Erwan'
#    email: 'RaissacErwan@gmail.com'
#    password: 'RaissacErwan'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Sieng Celine'
#    email: 'SiengCeline@gmail.com'
#    password: 'SiengCeline'
#    profile:
#      account: 'student'
#      connected: false
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Sieng Emilie'
#    email: 'SiengEmilie@gmail.com'
#    password: 'SiengEmilie'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Soetaert Salma'
#    email: 'SoetaertSalma@gmail.com'
#    password: 'SoetaertSalma'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Tagehlit Ryad'
#    email: 'TagehlitRyad@gmail.com'
#    password: 'TagehlitRyad'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Valadier Clement'
#    email: 'ValadierClement@gmail.com'
#    password: 'ValadierClement'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  
#   Accounts.createUser
#    username: 'Van-Moe Antoine'
#    email: 'Van-MoeAntoine@gmail.com'
#    password: 'Van-MoeAntoine'
#    profile:
#      account: 'student'
#      connected: true
#      currentExercice: null
#      answers: []
  



#   AppEvents.allow update: (userId, docs, fields, modifier) ->
#     return true
#   Meteor.users.allow update: (userId, docs, fields, modifier) ->
#    return true