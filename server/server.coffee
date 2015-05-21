Meteor.startup ->

  ############################################ 
  ### RESETS
  ############################################ 

  Exercices.remove {}
  Meteor.users.remove {}
  AppEvents.remove {}
  Groups.remove {}
  PopupEvents.remove {}
  
  ############################################ 
  ### EVENTS
  ############################################ 

  AppEvents.insert
    name: "indexClasses"
    indexClasses: 0

  AppEvents.insert
    name: "displayer"
    module: "display-send-exercice"



  ############################################ 
  ### POPUP
  ############################################ 

  PopupEvents.insert
    name: "student"
    user_id : ""
  
  





  ############################################ 
  ### GROUPS
  ############################################ 
    

  ############################################ 
  ### EXERCICES
  ############################################ 

  Exercices.insert
   number: Exercices.find().count() + 1
   question: '72 : 9 ='
   dividend: 72
   denominator: 9
   isAssisted: true
   validated: false
   level: "medium"
   answers:
     right: 8
     wrong: []


  Exercices.insert
   number: Exercices.find().count() + 1
   question: '66 : 6 ='
   dividend: 66
   denominator: 6
   isAssisted: true
   validated: false
   level: "medium"
   answers:
     right: 11
     wrong: []


  Exercices.insert
   number: Exercices.find().count() + 1
   question: '200 : 25 ='
   dividend: 200
   denominator: 25
   isAssisted: true
   validated: false
   level: "medium"
   answers:
     right: 8
     wrong: []

  Exercices.insert
   number: Exercices.find().count() + 1
   question: '45 : 5 ='
   dividend: 45
   denominator: 5
   isAssisted: true
   validated: false
   level: "medium"
   answers:
     right: 9
     wrong: []

  Exercices.insert
   number: Exercices.find().count() + 1
   question: '270 : 3 ='
   dividend: 270
   denominator: 3
   isAssisted: true
   validated: false
   level: "medium"
   answers:
     right: 90
     wrong: []

  Exercices.insert
   number: Exercices.find().count() + 1
   question: '56 : 8 ='
   dividend: 56
   denominator: 8
   isAssisted: true
   validated: false
   level: "medium"
   answers:
     right: 7
     wrong: []

  Exercices.insert
   number: Exercices.find().count() + 1
   question: '240 : 30 ='
   dividend: 240
   denominator: 30
   isAssisted: true
   validated: false
   level: "medium"
   answers:
     right: 8
     wrong: []


  console.log 'Insert one : ', Exercices.find().fetch()
  

  

  console.log Exercices.find().count()
  console.log 'Insert two : ', Exercices.find().fetch()
  
  ############################################ 
  ### ACCOUNTS TEACHER
  ############################################ 

  Accounts.createUser
   username: 'Philippe Neveu'
   email: 'PhilippeNeveu@gmail.com'
   password: 'PhilippeNeveu'
   profile: account: 'teacher'
  
  Accounts.createUser
   username: 'Admin admin'
   email: 'admin@gmail.com'
   password: 'admin'
   profile: account: 'teacher'
  

  ############################################ 
  ### ACCOUNTS STUDENTS
  ############################################ 
  

  Accounts.createUser
   username: 'Abla Louna'
   email: 'AblaLouna@gmail.com'
   password: 'AblaLouna'
   profile:
     account: 'student'
     scale: 1
     connected: false
     currentExercice: null
     answers: []

  Accounts.createUser
   username: 'Begidis Alban'
   email: 'BegidisAlban@gmail.com'
   password: 'BegidisAlban'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []

  Accounts.createUser
   username: 'Bihannic Etienne'
   email: 'BihannicEtienne@gmail.com'
   password: 'BihannicEtienne'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []

  Accounts.createUser
   username: 'Bouffier Anna'
   email: 'BouffierAnna@gmail.com'
   password: 'BouffierAnna'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []

  Accounts.createUser
   username: 'Canitrot Maud'
   email: 'CanitrotMaud@gmail.com'
   password: 'CanitrotMaud'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Chen Villon'
   email: 'ChenVillon@gmail.com'
   password: 'ChenVillon'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Corbeau Lilian'
   email: 'CorbeauLilian@gmail.com'
   password: 'CorbeauLilian'
   profile:
     account: 'student'
     scale: 1
     connected: false
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Cortez Benjamin'
   email: 'CortezBenjamin@gmail.com'
   password: 'CortezBenjamin'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Denchin Amalthee'
   email: 'DenchinAmalthee@gmail.com'
   password: 'DenchinAmalthee'
   profile:
     account: 'student'
     scale: 1
     connected: false
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Etienne Marzhin'
   email: 'EtienneMarzhin@gmail.com'
   password: 'EtienneMarzhin'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Jebabli Ayat'
   email: 'JebabliAyat@gmail.com'
   password: 'JebabliAyat'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Many Moutou'
   email: 'ManyMoutou@gmail.com'
   password: 'ManyMoutou'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Mendez Roxanne'
   email: 'MendezRoxanne@gmail.com'
   password: 'MendezRoxanne'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Metteni William'
   email: 'MetteniWilliam@gmail.com'
   password: 'MetteniWilliam'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Osti Maxime'
   email: 'OstiMaxime@gmail.com'
   password: 'OstiMaxime'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Pepas Margot'
   email: 'PepasMargot@gmail.com'
   password: 'PepasMargot'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Ponsardin Hugo'
   email: 'PonsardinHugo@gmail.com'
   password: 'PonsardinHugo'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Raissac Erwan'
   email: 'RaissacErwan@gmail.com'
   password: 'RaissacErwan'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Sieng Celine'
   email: 'SiengCeline@gmail.com'
   password: 'SiengCeline'
   profile:
     account: 'student'
     scale: 1
     connected: false
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Sieng Emilie'
   email: 'SiengEmilie@gmail.com'
   password: 'SiengEmilie'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Soetaert Salma'
   email: 'SoetaertSalma@gmail.com'
   password: 'SoetaertSalma'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  #
  Accounts.createUser
   username: 'Tagehlit Ryad'
   email: 'TagehlitRyad@gmail.com'
   password: 'TagehlitRyad'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Valadier Clement'
   email: 'ValadierClement@gmail.com'
   password: 'ValadierClement'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  
  Accounts.createUser
   username: 'Van-Moe Antoine'
   email: 'Van-MoeAntoine@gmail.com'
   password: 'Van-MoeAntoine'
   profile:
     account: 'student'
     scale: 1
     connected: true
     currentExercice: null
     answers: []
  



  AppEvents.allow update: (userId, docs, fields, modifier) ->
    return true
  Meteor.users.allow update: (userId, docs, fields, modifier) ->
   return true
  Groups.allow update: (userId, docs, fields, modifier) ->
   return true
  Groups.allow insert: (userId, docs, fields, modifier) ->
   return true
  PopupEvents.allow update: (userId, docs, fields, modifier) ->
   return true

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