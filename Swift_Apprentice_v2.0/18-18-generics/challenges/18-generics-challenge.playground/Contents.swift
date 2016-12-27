// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

/*:
 ## Generics Challenge
 
 Consider the pet and keeper example from earlier in the chapter:
 
 ```swift
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
 ```
 
 Imagine that instead of looking after only two animals, every keeper looks after a changing number of animals throughout the day. It could be one, two, ten animals per keeper instead of just morning and afternoon ones.
 
 You’d have to do things like the following:
 
 ```swift
 let christine = Keeper<Cat>(name: "Christine")
 
 christine.lookAfter(someCat)
 christine.lookAfter(anotherCat)
 ```
 
 You’d want to be able to access the count of all of animals for a keeper like `christine.countAnimals` and to access the 51st animal via a zero-based index like `christine.animalAtIndex(50)`.
  
 Of course, you’re describing your old friend the array type, `Array<Element>`!
 
 Your challenge is to update the `Keeper` type to have this kind of interface. You’ll probably want to include a private array inside `Keeper` and then provide methods and properties on `Keeper` to allow outside access to the array.
 
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

// solution:

class Keeper<Animal> {
  
  var name: String
  
  // this private array tracks the animals this keeper looks after
  // Note: it uses the same type Animal as the type parameter used to define the keeper
  private var animals: [Animal] = []
  
  init(name: String) {
    self.name = name
  }
  
  // adds a new animal to the keeper's list of animals
  func lookAfter(_ animal: Animal) -> Void {
    animals.append(animal)
  }
  
  // count the animals under the keeper's care
  var count: Int {
    return animals.count
  }
  
  // removes the last animal from the keeper's list of animals
  // It is an error to try to remove the last animal when there are no animals
  func removeLast() -> Animal {
    return animals.removeLast()
  }
  
  // returns the animal at `index`
  func animal(at index: Int) -> Animal {
    return animals[index]
  }
}

/*
 Additional comment:
 
 As one can see, the solution above needs do little more than merely wrap the underlying array primitive, exposing a few of its methods and properties.
 
 If you wanted your keeper to be able to access animals by name, you could search the array by animal name or use a dictionary instead of an array, mapping animals names to animal values.
 */
