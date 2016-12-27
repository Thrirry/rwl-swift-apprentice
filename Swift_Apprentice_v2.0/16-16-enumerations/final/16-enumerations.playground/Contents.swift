// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

// 1
let months = ["January", "February", "March", "April", "May",
              "June", "July", "August", "September", "October",
              "November", "December"]

// 2
func semester(for month: String) -> String {
  switch month {
  case "August", "September", "October", "November", "December":
    return "Autumn"
  case "January", "February", "March", "April", "May":
    return "Spring"
  default:
    return "Not in the school year"
  }
}

// 3
semester(for: "April") // Spring


//enum Month {
//  case january
//  case february
//  case march
//  case april
//  case may
//  case june
//  case july
//  case august
//  case september
//  case october
//  case november
//  case december
//}

//enum Month {
//  case january, february, march, april, may, june, july, august, september, october, november, december
//}

//func semester(for month: Month) -> String {
//  switch month {
//  case Month.august, Month.september, Month.october,
//       Month.november, Month.december:
//    return "Autumn"
//  case Month.january, Month.february, Month.march, Month.april,
//       Month.may:
//    return "Spring"
//  default:
//    return "Not in the school year"
//  }
//}

//func semester(for month: Month) -> String {
//  switch month {
//  case .august, .september, .october, .november, .december:
//    return "Autumn"
//  case .january, .february, .march, .april, .may:
//    return "Spring"
//  default:
//    return "Not in the school year"
//  }
//}

//enum Month: Int {
//  case january = 1, february = 2, march = 3, april = 4, may = 5,
//  june = 6, july = 7, august = 8, september = 9,
//  october = 10, november = 11, december = 12
//}

enum Month: Int {
  case january = 1, february, march, april, may, june, july, august, september, october, november, december
}

func semester(for month: Month) -> String {
  switch month {
  case .august, .september, .october, .november, .december:
    return "Autumn"
  case .january, .february, .march, .april, .may:
    return "Spring"
  case .june, .july:
    return "Summer"
  }
}

var month = Month.april
semester(for: month) // "Spring"

month = .september
semester(for: month) // "Autumn"

func monthsUntilWinterBreak(from month: Month) -> Int {
  return Month.december.rawValue - month.rawValue
}
monthsUntilWinterBreak(from: .april) // 8

//let fifthMonth = Month(rawValue: 5)
//monthsUntilWinterBreak(from: fifthMonth) // Error: value not unwrapped

let fifthMonth = Month(rawValue: 5)!
monthsUntilWinterBreak(from: fifthMonth)  // 7


// 1
enum Icon: String {
  case music
  case sports
  case weather
  
  var filename: String {
    // 2
    return "\(rawValue.capitalized).png"
  }
}
let icon = Icon.weather
icon.filename // Weather.png


enum Coin: Int {
  case penny = 1
  case nickel = 5
  case dime = 10
  case quarter = 25
}

let coin = Coin.quarter
coin.rawValue // 25


var balance = 100

//func withdraw(amount: Int) {
//  balance -= amount
//}

enum WithdrawalResult {
  case success(newBalance: Int)
  case error(message: String)
}

func withdraw(amount: Int) -> WithdrawalResult {
  if amount <= balance {
    balance -= amount
    return .success(newBalance: balance)
  } else {
    return .error(message: "Not enough money!")
  }
}

let result = withdraw(amount: 99)

switch result {
case .success(let newBalance):
  print("Your new balance is: \(newBalance)")
case .error(let message):
  print(message)
}


enum HTTPMethod {
  case get
  case post(body: String)
}

let request = HTTPMethod.post(body: "Hi there")
guard case .post(let body) = request else {
  fatalError("No message was posted")
}
print(body)


enum TrafficLight {
  case red, yellow, green
}
let trafficLight = TrafficLight.red


//struct Math {
//  static func factorial(of number: Int) -> Int {
//    return (1...number).reduce(1, *)
//  }
//}
//let factorial = Math.factorial(of: 6) // 720
//
//let math = Math()

enum Math {
  static func factorial(of number: Int) -> Int {
    return (1...number).reduce(1, *)
  }
}
let factorial = Math.factorial(of: 6) // 720

//let math = Math() // ERROR: No accessible initializers


var age: Int?
age = 17
age = nil

switch age {
case .none:
  print("No value")
case .some(let value):
  print("Got a value: \(value)")
}

let optionalNil: Int? = .none

optionalNil == nil    // true
optionalNil == .none  // true
