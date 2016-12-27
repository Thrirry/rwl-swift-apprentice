// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

/*
 Introducing inheritance.
 */

struct Grade {
  var letter: Character
  var points: Double
  var credits: Double
}

class Person {
  var firstName: String
  var lastName: String
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  // Added in section: Understanding the class lifecycle
  deinit {
    print("\(firstName) \(lastName) is being removed from memory!")
  }
}

class Student: Person {
  var grades: [Grade] = []
  
  func recordGrade(_ grade: Grade) {
    grades.append(grade)
  }
}

let john = Person(firstName: "Johnny", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")

john.firstName // "John"
jane.firstName // "Jane"

let history = Grade(letter: "B", points: 9.0, credits: 3.0)
jane.recordGrade(history)
//john.recordGrade(history) // john is not a student!

class BandMember: Student {
  var minimumPracticeTime = 2
}

class OboePlayer: BandMember {
  override var minimumPracticeTime: Int {
    get {
      return super.minimumPracticeTime * 2
    }
    set {
      super.minimumPracticeTime = newValue / 2
    }
  }
}

func phonebookName(_ person: Person) -> String {
  return "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "Johnny", lastName: "Appleseed")
let oboePlayer = OboePlayer(firstName: "Jane", lastName: "Appleseed")

phonebookName(person) // Appleseed, Johnny
phonebookName(oboePlayer) // Appleseed, Jane

var hallMonitor = Student(firstName: "Jill", lastName: "Bananapeel")

hallMonitor = oboePlayer

oboePlayer as Student
//(oboePlayer as Student).minimumPracticeTime // ERROR: No longer a band member!

hallMonitor as? BandMember
(hallMonitor as? BandMember)?.minimumPracticeTime // 4 (optional)

hallMonitor as! BandMember // Careful! Failure would lead to a runtime crash.
(hallMonitor as! BandMember).minimumPracticeTime // 4 (force unwrapped)

if let hallMonitor = hallMonitor as? BandMember {
  print("This hall monitor is a band member and practices at least \(hallMonitor.minimumPracticeTime) hours per week.")
}

func afterClassActivity(for student: Student) -> String {
  return "Goes home!"
}

func afterClassActivity(for student: BandMember) -> String {
  return "Goes to practice!"
}

afterClassActivity(for: oboePlayer) // Goes to practice!
afterClassActivity(for: oboePlayer as Student) // Goes home!

class StudentAthlete: Student {
  var failedClasses: [Grade] = []
  
  override func recordGrade(_ grade: Grade) {
    super.recordGrade(grade)
    
    if grade.letter == "F" {
      failedClasses.append(grade)
    }
  }
  
  var isEligible: Bool {
    return failedClasses.count < 3
  }
}

/*
 Inheritance and class initialization
 */

class Student2 {
  let firstName: String
  let lastName: String
  var grades: [Grade] = []
  
  required init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  convenience init(transfer: Student) {
    self.init(firstName: transfer.firstName, lastName: transfer.lastName)
  }
  
  func recordGrade(_ grade: Grade) {
    grades.append(grade)
  }
}

class StudentAthlete2: Student2 {
  var failedClasses: [Grade] = []
  var sports: [String]
  
  init(firstName: String, lastName: String, sports: [String]) {
    self.sports = sports
    let passGrade = Grade(letter: "P", points: 0.0, credits: 0.0)
    super.init(firstName: firstName, lastName: lastName)
    recordGrade(passGrade)
  }
  
  required init(firstName: String, lastName: String) {
    self.sports = []
    super.init(firstName: firstName, lastName: lastName)
  }
  
  override func recordGrade(_ grade: Grade) {
    super.recordGrade(grade)
    
    if grade.letter == "F" {
      failedClasses.append(grade)
    }
  }
  
  var isEligible: Bool {
    return failedClasses.count < 3
  }
}

/*
 Understanding the class lifecycle
 */

var someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Person object has a reference count of 1 (someone variable)

var anotherSomeone: Person? = someone
// Reference count 2 (someone, anotherSomeone)

var lotsOfPeople = [someone, someone, anotherSomeone, someone]
// Reference count 6 (someone, anotherSomeone, 4 references in lotsOfPeople)

anotherSomeone = nil
// Reference count 5 (someone, 4 references in lotsOfPeople)

lotsOfPeople = []
// Reference count 1 (someone)

someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Reference count 0 for the original Person object!
// Variable someone now references a new object

class Student3: Person {
  weak var partner: Student3?

  deinit {
    print("\(firstName) being deallocated!")
  }

}

var john2: Student3? = Student3(firstName: "Johnny", lastName: "Appleseed")
var jane2: Student3? = Student3(firstName: "Jane", lastName: "Appleseed")

john2?.partner = jane2
jane2?.partner = john2

john2 = nil
jane2 = nil
