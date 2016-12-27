// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

/*:
 ## Enumerations Challenge Set A
 
 Taking the coin example from earlier in the chapter, begin with an array of coins.
 
 ```swift
 enum Coin: Int {
   case penny = 1
   case nickel = 5
   case dime = 10
   case quarter = 25
 }
 
 let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]
 ```
 
 Write a function where you can pass in the `coinPurse`, add up the value and return the number of cents.
 
 */

enum Coin: Int {
  case penny = 1
  case nickel = 5
  case dime = 10
  case quarter = 25
}

let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]

func value(for purse: [Coin]) -> Int {
  var balance = 0
  for coin in purse {
    balance += coin.rawValue
  }
  return balance
}

value(for: coinPurse) // 77

// An advanced way to do the same thing would be to use higher order function `reduce(_:combine:)`:

let quickPurseValue = coinPurse.reduce(0) { $0 + $1.rawValue }
print(quickPurseValue) // 77
