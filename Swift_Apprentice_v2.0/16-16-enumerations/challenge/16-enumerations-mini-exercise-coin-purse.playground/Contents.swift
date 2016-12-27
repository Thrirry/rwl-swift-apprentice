// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// Create an array called `coinPurse` that contains coins. Add an assortment of pennies, nickels, dimes and quarters to it.

enum Coin: Int {
  case penny = 1
  case nickel = 5
  case dime = 10
  case quarter = 25
}

let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]
