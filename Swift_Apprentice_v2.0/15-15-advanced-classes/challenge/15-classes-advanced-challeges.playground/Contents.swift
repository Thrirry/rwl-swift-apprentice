// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

/*:
 ## Advanced Classes
 ### Question 1
 Create three simple classes called `A`, `B`, and `C` where `C` inherits from `B` and `B` inherits from `A`. In each class initializer, call `print("I'm <X>!")` both before and after `super.init()`. Create an instance of `C` called `c`.  What order do you see each `print()` called in?
 
    See below.
 */

/*:
 ### Question 2
  Implement `deinit` for each class. Place your `c` inside of a `do { }` scope which will cause the reference count to go to zero when it exits the scope. What order are the classes deinitialized in?
 */

class A {
  init() {
    print("I'm A!(1)")
  }
  deinit {
    print("Destroy A")
  }
}

class B: A {
  deinit {
    print("Destroy B")
  }
  override init() {
    print("I'm B!(1)")
    super.init()
    print("I'm B!(2)")
  }
}

class C: B {
  deinit {
    print("Destroy C")
  }
  override init() {
    print("I'm C!(1)")
    super.init()
    print("I'm C!(2)")
  }
}

do {
  let c = C()
}

/*:
 ### Question 3
 Cast the instance of type `C` to an instance of type `A`. Which casting operation do you use and why?
 */

do {
  let c = C()
  let a = c as A
  // The as keyword can be used because the compiler can guarntee the type of `c` to be derived from `A` at compilter time.
}

/*:
### Question 4
Create a subclass of `StudentAthlete` called `StudentBaseballPlayer` and include properties for `position`, `number`, and `battingAverage`.  What are the benefits and drawbacks of subclassing `StudentAthlete` in this scenario?
 */

class Person {
  var firstName: String
  var lastName: String

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

struct Grade {
  let letter: String
  let points: Double
}

class Student: Person {
  var grades: [Grade] = []
}

class StudentAthlete: Student {
  var sports: [String] = []
}

class StudentBaseballPlayer: Student {
  var battingAverage = 0.0
  var number: Int
  var position: String

  init(firstName: String, lastName: String, number: Int, position: String) {
    self.number = number
    self.position = position
    super.init(firstName: firstName, lastName: lastName)
  }
}

/*
 Benefits:

 - Automatically get properties all student atheletes will have - grades and names
 - Type relationship with superclasses. StudentBaseballPlayer _is_ a Student

 Drawbacks:

 - An initializer that is beginning to get bloated
 - `sports` is a bit awkward to a baseball player object
 - Deep class hierarchy would make similar classes difficult. For instance, an almost identical class would need to be made for a `SoftballPlayer` who joined a league after graduating. They would no longer be a `Student`, only a `Person`!
*/

/*:
 ### Question 5
 
 Can you think of an alternative to sublcassing? Assume you could modify any class in the hierarchy.
 */

/*
 One could put much of this information into an object that did not inherit all the way down from person, but instead simply held information about the sport. In other words, a `Baseball` object could be owned by the `StudentAthlete` object that would simply have average, position, and number. This is known as "composition" as an alternative to "inheritance".
 */

/*:
 ### Question 6
 Fix the following classes so there isn't a memory leak when you add an order.
 */

class Customer {
  let name: String
  var orders: [Order] = []
  init(name: String) {
    self.name = name
  }
  
  func add(_ order: Order) {
    order.customer = self
    orders.append(order)
  }
  deinit {
    print("Deinit \(name)")
  }
}

class Order {
  let product: String
  weak var customer: Customer?
  init(product: String) {
    self.product = product
  }
  deinit {
    print("Deinit \(product)")
  }
}

do {
  let ray = Customer(name: "Ray")
  let fries = Order(product: "Fries")
  ray.add(fries)
}



