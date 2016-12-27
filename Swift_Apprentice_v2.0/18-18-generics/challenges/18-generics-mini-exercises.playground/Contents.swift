// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

class Cat {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

class Dog {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

class Keeper<Animal> {
  var name: String
  var morningCare: Animal
  var afternoonCare: Animal
  
  init(name: String, morningCare: Animal, afternoonCare: Animal) {
    self.name = name
    self.morningCare = morningCare
    self.afternoonCare = afternoonCare
  }
}

// Mini-exercise 1: Try instantiating another `Keeper`, but this time for dogs.

// let us suppose that Sally is the name of a person who looks after dogs, a dog named "Benji" in the morning and dog named "Rufus" in the afternoon

let sally = Keeper(name: "Sally", morningCare: Dog(name: "Benji"), afternoonCare: Dog(name: "Rufus"))

// Mini-exercise 2: What do you think would happen if you tried to instantiate a `Keeper` with a dog in the morning and a cat in the afternoon?

// This app does not drive a nuclear reactor. The best way to find out is to try! Let us uncomment the following line

//let paul = Keeper(name: "Paul", morningCare: Dog(name: "Lucky"), afternoonCare: Cat(name: "Sleepy"))

/*
 The error we get is the following: Cannot convert value of type 'Cat' to expected argument type 'Dog'. This is what we'd expect. Swift wants the second animal to have the same type as the first, in this case 'Dog'.
*/


