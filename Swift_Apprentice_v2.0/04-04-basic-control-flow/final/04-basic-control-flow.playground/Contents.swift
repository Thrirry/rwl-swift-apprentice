// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// COMPARISON OPERATORS
//let yes: Bool = true
//let no: Bool = false
let yes = true
let no = false

let doesOneEqualTwo = (1 == 2)
let doesOneNotEqualTwo = (1 != 2)
let alsoTrue = !(1 == 2)
let isOneGreaterThanTwo = (1 > 2)
let isOneLessThanTwo = (1 < 2)

let and = true && true
let or = true || false

let andTrue = 1 < 2 && 4 > 3
let andFalse = 1 < 2 && 3 > 4

let orTrue = 1 < 2 || 3 > 4
let orFalse = 1 == 2 || 3 == 4

let andOr = (1 < 2 && 3 > 4) || 1 < 4

let guess = "dog"
let dogEqualsCat = guess == "cat"

let order = "cat" < "dog"

let stringA = "café"
let stringB = "cafe\u{0301}"
let equal = stringA == stringB


// IF-STATEMENTS
if 2 > 1 {
  print("Yes, 2 is greater than 1.")
}

let animal = "Fox"
if animal == "Cat" || animal == "Dog" {
  print("Animal is a house pet.")
} else {
  print("Animal is not a house pet.")
}

let hourOfDay = 12
let timeOfDay: String

if hourOfDay < 6 {
  timeOfDay = "Early morning"
} else if hourOfDay < 12 {
  timeOfDay = "Morning"
} else if hourOfDay < 17 {
  timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
  timeOfDay = "Evening"
} else if hourOfDay < 24 {
  timeOfDay = "Late evening"
} else {
  timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)

let name = "Matt Galloway"

if 1 > 2 && name == "Matt Galloway" {
  // ...
}

if 1 < 2 || name == "Matt Galloway" {
  // ...
}


// SCOPE
var hoursWorked = 45

var price = 0
if hoursWorked > 40 {
  let hoursOver40 = hoursWorked - 40
  price += hoursOver40 * 50
  hoursWorked -= hoursOver40
}
price += hoursWorked * 25

print(price)
//print(hoursOver40)


// TERNARY OPERATOR
let a = 5
let b = 10

/*
let min: Int
if a < b {
  min = a
} else {
  min = b
}
*/
let min = a < b ? a : b

/*
let max: Int
if a > b {
  max = a
} else {
  max = b
}
*/
let max = a > b ? a : b


// WHILE LOOPS
//while true { // Commented out as this will loop forever
//}

// Made up sequence (it's powers of 2 minus 1, i.e. 3, 7, 15, 31, 63, etc)
var sum1 = 1
while sum1 < 1000 {
  sum1 = sum1 + (sum1 + 1)
}
sum1

var sum2 = 1
repeat {
  sum2 = sum2 + (sum2 + 1)
} while sum2 < 1000
sum2

var sum3 = 1
while sum3 < 1 {
  sum3 = sum3 + (sum3 + 1)
}
sum3

var sum4 = 1
repeat {
  sum4 = sum4 + (sum4 + 1)
} while sum4 < 1
sum4

var sum5 = 1
while true {
  sum5 = sum5 + (sum5 + 1)
  if sum5 >= 1000 {
    break
  }
}
sum5
