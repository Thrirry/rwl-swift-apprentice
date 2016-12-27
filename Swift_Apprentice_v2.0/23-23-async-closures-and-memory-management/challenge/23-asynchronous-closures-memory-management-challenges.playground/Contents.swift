// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

/*:
 ## Asynchronous Closures and Memory Management Challenges
 ### Challenge A
 
 Break the strong reference cycle in the following code:
 
 ```
 class Person {
   let name: String
   let email: String
   var car: Car?
   init(name: String, email: String) {
     self.name = name
     self.email = email
   }
   deinit {
     print("Goodbye \(name)!")
   }
 }
 class Car {
   let id: Int
   let type: String
   var owner: Person?
   init(id: Int, type: String) {
     self.id = id
     self.type = type
   }
   deinit {
     print("Goodbye \(type)!")
   }
 }
 var owner: Person? = Person(name: "Cosmin", email: "cosmin@whatever.com")
 var car: Car? = Car(id: 10, type: "BMW")
 owner?.car = car
 car?.owner = owner
 owner = nil
 car = nil
 ```
 */

class Person {
  let name: String
  let email: String
  var car: Car?
  
  init(name: String, email: String) {
    self.name = name
    self.email = email
  }
  
  deinit {
    print("Goodbye \(name)!")
  }
}

class Car {
  let id: Int
  let type: String
  weak var owner: Person?
  
  init(id: Int, type: String) {
    self.id = id
    self.type = type
  }
  
  deinit {
    print("Goodbye \(type)!")
  }
}

var owner: Person? = Person(name: "Cosmin", email: "cosmin@whatever.com")
var car: Car? = Car(id: 10, type: "BMW")

owner?.car = car
car?.owner = owner

owner = nil
car = nil

/*:
 ### Challenge B
 
Break the strong reference cycle in the following code:

```swift
class Customer {
  let name: String
  let email: String
  var account: Account?
  
  init(name: String, email: String) {
    self.name = name
    self.email = email
  }
  
  deinit {
    print("Goodbye \(name)!")
  }
}

class Account {
  let number: Int
  let type: String
  let customer: Customer
  
  init(number: Int, type: String, customer: Customer) {
    self.number = number
    self.type = type
    self.customer = customer
  }
  
  deinit {
    print("Goodbye \(type) account number \(number)!")
  }
}

var customer: Customer? = Customer(name: "George", email: "george@whatever.com")
var account: Account? = Account(number: 10, type: "PayPal", customer: customer!)

customer?.account = account

account = nil
customer = nil
```
*/

class Customer {
  let name: String
  let email: String
  var account: Account?
  
  init(name: String, email: String) {
    self.name = name
    self.email = email
  }

  deinit {
    print("Goodbye \(name)!")
  }
}

class Account {
  let number: Int
  let type: String
  unowned let customer: Customer // An account should always be assigned to a customer, so use unowned instead of weak
  
  init(number: Int, type: String, customer: Customer) {
    self.number = number
    self.type = type
    self.customer = customer
  }
  
  deinit {
    print("Goodbye \(type) account number \(number)!")
  }
}

var customer: Customer? = Customer(name: "George", email: "george@whatever.com")
var account: Account? = Account(number: 10, type: "PayPal", customer: customer!)

customer?.account = account

account = nil
customer = nil
