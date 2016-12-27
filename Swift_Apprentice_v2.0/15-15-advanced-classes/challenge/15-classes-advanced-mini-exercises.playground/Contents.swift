// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

/*
 What's different in the two-phase initialization in the base class `Person`, as compared to the others?
 
 Answer: class `Person`, being the base class, is not required to call an initializer in a superclass.
 */

/*
 Create two more convenience initializers on `Student`. What other initializers are you able to call?
 
 Answer: the convenience initializers are able to call the other convenience initializers in addition to the designated initializer.
 */

/*
 Modify the `Student` class to have the ability to record the student's name to a list of graduates. Add the name of the student to the list when the object is deallocated.
 */

struct Grade {
  var letter: Character
  var points: Double
  var credits: Double
}

class Student {
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
  
  convenience init(name: String) {
    self.init(firstName: "name", lastName: "")
  }
  
  convenience init() {
    self.init(firstName: "", lastName: "")
  }
  
  func recordGrade(_ grade: Grade) {
    grades.append(grade)
  }
  
  static var graduates: [String] = []
  
  deinit {
    Student.graduates.append("\(lastName), \(firstName)")
  }
}

class StudentAthlete: Student {
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
