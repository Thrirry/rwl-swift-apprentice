// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

// FOR LOOPS
let range = 1...10
for i in range {
  let square = i * i
  print("\(square)")
}

for i in range {
  let squareRoot = sqrt(Double(i))
  print("\(squareRoot)")
}

var sum = 0
for row in 0..<8 where row % 2 == 1 {
  for column in 0..<8 {
    sum += row * column
  }
}
sum


// SWITCH STATEMENTS
let myAge = 30

switch myAge {
case _ where myAge >= 0 && myAge <= 2:
  print("Infant")
case _ where myAge >= 3 && myAge <= 12:
  print("Child")
case _ where myAge >= 13 && myAge <= 19:
  print("Teenager")
case _ where myAge >= 20 && myAge <= 39:
  print("Adult")
case _ where myAge >= 40 && myAge <= 60:
  print("Middle aged")
case _ where myAge >= 61:
  print("Elderly")
default:
  print("Invalid age")
}

let tuple = ("Matt", 30)
switch tuple {
case let (name, age) where age >= 0 && age <= 2:
  print("\(name) is a infant")
case let (name, age) where age >= 3 && age <= 12:
  print("\(name) is a child")
case let (name, age) where age >= 13 && age <= 19:
  print("\(name) is a teenager")
case let (name, age) where age >= 20 && age <= 39:
  print("\(name) is an adult")
case let (name, age) where age >= 40 && age <= 60:
  print("\(name) is a middle aged")
case let (name, age) where age >= 61:
  print("\(name) is a elderly")
default:
  print("Invalid age")
}
