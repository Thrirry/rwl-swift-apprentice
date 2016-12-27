// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)


// failable initializers

let value = Int("3")
let failedValue = Int("nope")

enum PetFood: String {
  case kibble, canned
}

let morning = PetFood.init(rawValue: "kibble")
let snack = PetFood.init(rawValue: "fud!")

struct PetHouse {
  let squareFeet: Int
  
  init?(squareFeet: Int) {
    if squareFeet < 1 {
      return nil
    }
    self.squareFeet = squareFeet
  }
}

let tooSmall = PetHouse(squareFeet: 0) // nil
let house = PetHouse(squareFeet: 1)    // okay




/*
class Pet {
  var breed: String?
  
  init(breed: String? = nil) {
    self.breed = breed
  }
}

class Person {
  let pet: Pet
  
  init(pet: Pet) {
    self.pet = pet
  }
}

let delia = Pet(breed: "pug")
let olive = Pet()

let janie = Person(pet: olive)
let dogBreed = janie.pet.breed! // This is bad! Will cause a crash!

if let dogBreed = janie.pet.breed {
  print("Olive is a \(dogBreed)")
} else {
  print("Olive's breed is unknown.")
}
 */

class Toy {
  
  enum Kind {
    case ball
    case zombie
    case bone
    case mouse
  }
  
  enum Sound {
    case squeak
    case bell
  }
  
  let kind: Kind
  let color: String
  var sound: Sound?
  
  init(kind: Kind, color: String, sound: Sound? = nil) {
    self.kind = kind
    self.color = color
    self.sound = sound
  }
}

class Pet {
  
  enum Kind {
    case dog
    case cat
    case guineaPig
  }
  
  let name: String
  let kind: Kind
  let favoriteToy: Toy?
  
  init(name: String, kind: Kind, favoriteToy: Toy? = nil) {
    self.name = name
    self.kind = kind
    self.favoriteToy = favoriteToy
  }
}

class Person {
  let pet: Pet?
  
  init(pet: Pet? = nil) {
    self.pet = pet
  }
}

let janie = Person(pet: Pet(name: "Delia", kind: .dog, favoriteToy: Toy(kind: .ball, color: "Purple", sound: .bell)))
let tammy = Person(pet: Pet(name: "Evil Cat Overlord", kind: .cat, favoriteToy: Toy(kind: .mouse, color: "Orange")))
let felipe = Person()

if let sound = janie.pet?.favoriteToy?.sound {
  print("Sound \(sound)")
} else {
  print("No sound.")
}

if let sound = tammy.pet?.favoriteToy?.sound {
  print("Sound \(sound)")
} else {
  print("No sound.")
}

if let sound = felipe.pet?.favoriteToy?.sound {
  print("Sound \(sound)")
} else {
  print("No sound.")
}

let team = [janie, tammy, felipe]

let petNames = team.map { $0.pet?.name }

for pet in petNames {
  print(pet)
}

let betterPetNames = team.flatMap { $0.pet?.name }

for pet in betterPetNames {
  print(pet)
}
