//: Playground - noun: a place where people can play

import UIKit

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String{
        return "\(firstName) \(lastName)"
    }
}

let person = Person(firstName: "Hoff", lastName: "Silva")
var homeOwner = person

person.firstName = "henry"
print(person.firstName)

homeOwner.firstName = "Hnery"
print(homeOwner.firstName)

homeOwner.lastName = "Pereira"

print(person.fullName)
print(homeOwner.fullName)

//person === homeOwner

let imposterPerson = Person(firstName: "Hoffs", lastName: "Silvas")

person === homeOwner
person === imposterPerson

imposterPerson === homeOwner

homeOwner = imposterPerson


