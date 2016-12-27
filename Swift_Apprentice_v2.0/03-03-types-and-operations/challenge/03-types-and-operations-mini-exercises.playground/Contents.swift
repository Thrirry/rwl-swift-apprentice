// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)
import Foundation

// TYPES
let age1 = 42
let age2 = 21
let avg1 = (age1 + age2) / 2
// Both operands of / are integers so the operation is an integer division and the result is truncated.
let avg2 = (Double(age1) + Double(age2)) / 2
// The first operand of / is now a Double. Because of this, 2 is inferred to be a Double as well and the result is correct.


// STRINGS
let firstName = "Matt"
let lastName = "Galloway"
let fullName = firstName + " " + lastName
let myDetails = "Hello, my name is \(fullName)."


// TUPLES
let temperature = (10, 17, 2015, 15.7)
let temperature2 = (month: 10, day: 17, year: 2015, averageTemperature: 15.7)
let (_, day, _, averageTemperature) = temperature2
var temperature3 = (month: 10, day: 17, year: 2015, averageTemperature: 15.7)
temperature3.averageTemperature = 21.2
