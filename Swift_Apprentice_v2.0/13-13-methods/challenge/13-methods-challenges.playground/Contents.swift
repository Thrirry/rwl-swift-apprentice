// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

/*:
 ## Method Challenges
 ### Question 1

 Given the `Circle` structure:
 
 ```
 struct Circle {
 
   var radius = 0.0
 
   var area: Double {
     return .pi * radius * radius
   }
 
   init (radius: Double) {
     self.radius = radius
   }
 }
 ```
 
 Write a method that can change an instance's area by a growth factor. For example if you call `circle.grow(byFactor: 3), the area of the instance will triple.
 
 Hint: Add a setter to `area`.
*/

struct Circle {
  
  var radius = 0.0
  
  var area: Double {
    get {
      return .pi * radius * radius
    }
    set {
      radius = sqrt(newValue / .pi)
    }
  }

  init (radius: Double) {
    self.radius = radius
  }

  mutating func grow(byFactor factor: Double) {
    area = area * factor
  }
}

var circle = Circle(radius: 5)
let originalCircleArea = circle.area // 78.54
circle.grow(byFactor: 3)
let newCircleArea = circle.area // 235.62


/*:
 ### Question 2
 Below is a naive way of writing `advance()` for the `SimpleDate` structure you saw earlier in the chapter:
 
 ```swift
 let months = ["January", "February", "March",
   "April", "May", "June",
   "July", "August", "September",
   "October", "November", "December"]
 
 struct SimpleDate {
   var month: String
   var day: Int
 
   init(month: String, day: Int) {
     self.month = month
     self.day = day
   }
 
   mutating func advance() {
     day += 1
   }
 }
 
 var current = SimpleDate(month: "December", day: 31)
 current.advance()
 let currentMonth = current.month // December; should be January!
 let currentDay = current.day // 32; should be 1!
```
 
 */
let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

struct Date {
  
  var month: String
  var day: Int
  
  init(month: String, day: Int) {
    self.month = month
    self.day = day
  }
  
  var totalDaysInCurrentMonth: Int {
    switch month {
    case "January", "March", "May", "July", "August", "October", "December":
      return 31
    case "April", "June", "September", "November":
      return 30
    case "February": // Note: leap years aren't taken into account here.
      return 28
    default:
      return 0
    }
  }
  
  mutating func advance() {
    // Check for the end of the month
    if day == totalDaysInCurrentMonth {
      // Check for the end of the year
      if month == "December" {
        month = "January"
      } else {
        // Increment the month
        month = months[months.index(of: month)!.advanced(by: 1)]
      }
      // Start over at the first day of the month
      day = 1
    } else {
      // It is not the end of the month, just increment the day
      day += 1
    }
  }
}

var current = Date(month: "December", day: 31)
current.advance()
let currentMonth = current.month // January
let currentDay = current.day // 1

/*:
 ### Question 3
 Add type methods to your `Math` namespace called `isEven` and `isOdd` that return true if the number is even or odd respectively.
 */
struct Math {}

extension Math {
  static func isEven(_ value: Int) -> Bool {
    return value % 2 == 0
  }
  static func isOdd(_ value: Int) -> Bool {
    return (value+1) % 2 == 0
  }
}

Math.isOdd(30) // false
Math.isOdd(33) // true
Math.isEven(20) // true
Math.isEven(21) // false


/*:
 ### Question 4
 It turns out that `Int` is just a struct.  Add the computed properties `isEven` and `isOdd` to `Int` using an extension. (Note: Generally, you want to be careful about what functionality you add to standard library types as it can cause confusion for readers.)
 */
extension Int {
  var isEven: Bool {
    return self % 2 == 0
  }
  var isOdd: Bool {
    return (self+1) % 2 == 0
  }
}

2.isEven // true
3.isEven // false
2.isOdd  // false
3.isOdd  // true

/*:
 ### Question 5
Add the method `primeFactors()` to `Int`.  Note: Since this is an expensive operation, this is best left as an actual method. (Note: This method is probably not a good addition to the standard library `Int` because of confusion it might cause. It is good for learning in the playground though!)
*/

extension Int {
  func primeFactors() -> [Int] {
    var remainingValue = self
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

81.primeFactors()
18.primeFactors()
57.primeFactors()

