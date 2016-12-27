// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

// --- Introduction

class Person {
  var firstName: String
  var lastName: String
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
}

let john = Person(firstName: "Johnny", lastName: "Appleseed")

// --- Reference types

var homeOwner = john

john.firstName = "John" // John wants to use his short name!

john.firstName // "John"
homeOwner.firstName // "John"

john === homeOwner // true

let imposterJohn = Person(firstName: "Johnny", lastName: "Appleseed")

john === homeOwner // true
john === imposterJohn // false
imposterJohn === homeOwner // false

// Assignment of existing variables changes the instances the variables reference.
homeOwner = imposterJohn
john === homeOwner // false

homeOwner = john
john === homeOwner // true

// Create fake, imposter Johns. Use === to see if any of these imposters are our real John.
var imposters = (0...100).map { _ in
  Person(firstName: "John", lastName: "Appleseed")
}

// Equality (==) is not effective when John cannot be identified by his name alone
imposters.contains {
  $0.firstName == john.firstName &&
    $0.lastName == john.lastName
}

// Check to ensure the real John is not found among the imposters.
imposters.contains {
  $0 === john
} // false

// Now hide the "real" John somewhere among the imposters. John can now be found among the imposters
imposters.insert(john, at: Int(arc4random_uniform(100)))

imposters.contains {
  $0 === john
} // true

// Since `Person` is a reference type, you can use === to grab the real John out of the list of imposters and modify the value.
// The original `john` variable will print the new last name!
if let whereIsJohn = imposters.index(where: { $0 === john }) {
  imposters[whereIsJohn].lastName = "Bananapeel"
}

john.fullName // John Bananapeel

struct Grade {
  let letter: String
  let points: Double
  let credits: Double
}

class Student {
  var firstName: String
  var lastName: String
  var grades: [Grade] = []
  var credits = 0.0 // Added in section "Understanding state and side effects
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  func recordGrade(_ grade: Grade) {
    grades.append(grade)
    credits += grade.credits // Added in section "Understanding state and side effects
  }
}

let jane = Student(firstName: "Jane", lastName: "Appleseed")
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
var math = Grade(letter: "A", points: 16.0, credits: 4.0)

jane.recordGrade(history)
jane.recordGrade(math)

// Error: jane is a `let` constant
//jane = Student(firstName: "John", lastName: "Appleseed")

// --- Understanding state and side effects

jane.credits // 7

// The teacher made a mistake; math has 5 credits
math = Grade(letter: "A", points: 20.0, credits: 5.0)
jane.recordGrade(math)

jane.credits // 12, not 8!

extension Student {
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
}

jane.fullName // "Jane Appleseed"



