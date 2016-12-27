// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

//: 1. Create a struct `Person` in a new Sources file. This struct should have `first`, `last` and `fullName` properties that are readable but not writable by the playground.

let john = Person(first: "Johnny", last: "Appleseed")
john.fullName

//: 2. Create a similar type, except make it a class and call it `ClassyPerson`. In the playground, subclass `ClassyPerson` with class `Doctor` and make a doctor's `fullName` print the prefix "Dr.".

class Doctor: ClassyPerson {
  override var fullName: String {
    return "Dr. \(super.fullName)"
  }
}

let jane = Doctor(first: "Jane", last: "Appleseed")
jane.fullName
