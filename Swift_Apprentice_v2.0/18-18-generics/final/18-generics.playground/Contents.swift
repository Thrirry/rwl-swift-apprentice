// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

// try 0: values driving values
enum PetKind {
  case cat
  case dog
}

struct KeeperKind {
  var keeperOf: PetKind
}

let catKeeper = KeeperKind(keeperOf: .cat)
let dogKeeper = KeeperKind(keeperOf: .dog)

// types driving types

/* try 1: manually mirrored types
class Cat {}
class Dog {}

class KeeperForCats {}
class KeeperForDogs {}
*/

/* try 2: generics to establish type relationship
class Cat {}
class Dog {}

class Keeper<Animal> {}

var aCatKeeper = Keeper<Cat>()
//var aKeeper = Keeper()  // compile-time error!
*/

/* try 3: add identity. now we have collections
*/
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

let jason = Keeper(name: "Jason", morningCare: Cat(name: "Whiskers"), afternoonCare: Cat(name: "Sleepy"))

protocol Pet {
  var name: String { get }  // all pets respond to a name
}
extension Cat: Pet {}
extension Dog: Pet {}

let cats = ["Miss Gray", "Whiskers", "Sleepy"].map { Cat(name: $0) }
let dogs = ["Sparky", "Rusty", "Astro"].map { Dog(name: $0) }
let pets: [Pet] = [Cat(name: "Mittens"), Dog(name: "Yeller")]

func herd(_ pets: [Pet]) {
  pets.forEach {
    print("Come \($0.name)!")
  }
}

func herd<Animal: Pet>(_ pets: [Animal]) {
  pets.forEach {
    print("Here \($0.name)!")
  }
}

func herd<Animal: Cat>(_ cats: [Animal]) {
  cats.forEach {
    print("Here kitty kitty. Here \($0.name)!")
  }
}

func herd<Animal: Dog>(_ dogs: [Animal]) {
  dogs.forEach {
    print("Here \($0.name)! Come here!")
  }
}

herd(dogs)
herd(cats)
herd(pets)

extension Array where Element: Cat {
  func meow() {
    forEach { print("\($0.name) says meow!") }
  }
}

// dogs.meow() // error: 'Dog' is not a subtype of 'Cat'
cats.meow()


let intNames: Dictionary<Int, String> = [42: "forty-two"]
let intNames2: [Int: String] = [42: "forty-two", 7: "seven"]
let intNames3 = [42: "forty-two", 7: "seven"]

enum OptionalDate {
  case none
  case some(Date)
}

enum OptionalString {
  case none
  case some(String)
}

struct FormResults {
  // other properties here
  var birthday: OptionalDate
  var lastName: OptionalString
}

var birthdate: Optional<Date> = .none
if birthdate == .none {
  // no birthdate
}

var birthdate2: Date? = nil
if birthdate2 == nil {
  // no birthdate
}

func swapped<T, U>(_ x: T, _ y: U) -> (U, T) {
  return (y, x)
}

swapped(33, "Jay")  // returns ("Jay", 33)
