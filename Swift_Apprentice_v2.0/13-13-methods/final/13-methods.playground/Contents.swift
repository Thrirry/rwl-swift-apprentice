// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

var numbers = [1, 2, 3]
numbers.removeLast()
let newArray = numbers // [1, 2]

// --- Turning a function into a method

let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

//struct SimpleDate {
//  var month: String
//}
//
//func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
//  return months.index(of: "December")! - months.index(of: date.month)!
//}

//struct SimpleDate {
//  var month: String
//  
//  func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
//    return months.index(of: "December")! - months.index(of: date.month)!
//  }
//}
//
//let date = SimpleDate(month: "October")
//let monthsLeft = date.monthsUntilWinterBreak(from: date) // 2

//let monthsLeft = date.monthsUntilWinterBreak() // Error!

// --- Introducing self

//struct SimpleDate {
//  var month: String
//
//  func monthsUntilWinterBreak() -> Int {
//    return months.index(of: "December")! - months.index(of: self.month)!
//  }
//}
//
//let date = SimpleDate(month: "October")
//let monthsLeft = date.monthsUntilWinterBreak() // 2

// --- Introducing initializers

//struct SimpleDate {
//  var month: String
//  
//  init() {
//    month = "January"
//  }
//  
//  func monthsUntilWinterBreak() -> Int {
//    return months.index(of: "December")! - months.index(of: month)!
//  }
//}
//
//let date = SimpleDate()
//let month = date.month // January
//let monthsLeft = date.monthsUntilWinterBreak() // 11

// --- Initializers in structures

//struct SimpleDate {
//  var month: String
//  var day: Int
//  
//  init() {
//    month = "March"
//    day = 1
//  }
//  
//  init(month: String, day: Int) {
//    self.month = month
//    self.day = day
//  }
//}
//
//let date = SimpleDate(month: "February", day: 14)
//let month = date.month // February
//let day = date.day // 14

// --- Mutating methods
//struct SimpleDate {
//  var month: String
//  var day: Int
//  
//  init() {
//    month = "March"
//    day = 1
//  }
//  
//  init(month: String, day: Int) {
//    self.month = month
//    self.day = day
//  }
//  
//  mutating func advance() {
//    day += 1
//  }
//}

struct SimpleDate {
  var month: String
  var day: Int
  
  mutating func advance() {
    day += 1
  }
}

extension SimpleDate {
  init() {  // init in extension preserves compiler generate init
    month = "March"
    day = 1
  }
}

// --- Type methods

struct Math {
  static func factorial(of number: Int) -> Int {
    return (1...number).reduce(1, *)
  }
}

let factorial = Math.factorial(of: 6) // 720

// --- Extensions

extension Math {
  static func primeFactors(of value: Int) -> [Int] {
    var remainingValue = value
    var testFactor = 2
    var primes: [Int] = []
    while testFactor * testFactor <= remainingValue {
      if remainingValue % testFactor == 0 {
        primes.append(testFactor)
        remainingValue /= testFactor
      }
      else {
        testFactor += 1
      }
    }
    if remainingValue > 1 {
      primes.append(remainingValue)
    }
    return primes
  }
}
Math.primeFactors(of: 81) // [3, 3, 3, 3]
