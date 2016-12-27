// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

/*: 
 ## Protocol Oriented Programming
 ### Challenge A: Protocol extension practice
 Suppose you own a retail store. You have food items, clothes and electronics. Begin with an `Item` protocol:
 
 ```swift
 protocol Item {
   var name: String { get }
   var clearance: Bool { get }
   var msrp: Double { get }
   var totalPrice: Double { get }
 }
 ```
 
 Fulfill the following requirements using primarily what you’ve learned about protocol-oriented programming. In other words, minimize the code in your classes, structs or enums.
 
 * Clothes do not have sales tax, but all other items have 7.5% sales tax.
 * When on clearance, food items are discounted 50%, clothes are discounted 25% and electronics are discounted 5%.
 * Items should implement `CustomStringConvertible` and return `name`. Food items should also print their expiration dates.

 */

protocol Item: CustomStringConvertible {
  var name: String { get }
  var clearance: Bool { get }
  var msrp: Double { get }
  var totalPrice: Double { get }
}

protocol Taxable: Item {
  var taxPercentage: Double { get }
}

protocol Discountable: Item {
  var adjustedMsrp: Double { get }
}

extension Item {
  var description: String {
    return name
  }
}

extension Item {
  var totalPrice: Double {
    return msrp
  }
}

extension Item where Self: Taxable {
  var totalPrice: Double {
    return msrp * (1 + taxPercentage)
  }
}

extension Item where Self: Discountable {
  var totalPrice: Double {
    return adjustedMsrp
  }
}

extension Item where Self: Taxable & Discountable {
  var totalPrice: Double {
    return adjustedMsrp * (1 + taxPercentage)
  }
}

struct Clothing: Discountable {
  let name: String
  var msrp: Double
  var clearance: Bool

  var adjustedMsrp: Double {
    return msrp * (clearance ? 0.75 : 1.0)
  }
}

struct Electronics: Taxable, Discountable {
  let name: String
  var msrp: Double
  var clearance: Bool

  let taxPercentage = 0.075
  
  var adjustedMsrp: Double {
    return msrp * (clearance ? 0.95 : 1.0)
  }
}

struct Food: Taxable {
  let name: String
  var msrp: Double
  var clearance: Bool
  let expirationDate: (month: Int, year: Int)

  let taxPercentage = 0.075
  
  var adjustedMsrp: Double {
    return msrp * (clearance ? 0.50 : 1.0)
  }

  var description: String {
    return "\(name) - expires \(expirationDate.month)/\(expirationDate.year)"
  }
}

Food(name: "Bread", msrp: 2.99, clearance: false, expirationDate: (11, 2016)).totalPrice
Clothing(name: "Shirt", msrp: 12.99, clearance: true).totalPrice
Clothing(name: "Last season shirt", msrp: 12.99, clearance: false).totalPrice
Electronics(name: "Apple TV", msrp: 139.99, clearance: false).totalPrice
Electronics(name: "Apple TV 3rd gen", msrp: 99.99, clearance: true).totalPrice

// Custom string convertible demonstration
Food(name: "Bread", msrp: 2.99, clearance: false, expirationDate: (11, 2016))
Electronics(name: "Apple TV 3rd gen", msrp: 99.99, clearance: true)

/*: 
 ### Challenge B: Randomization
 
 Write a protocol extension on `Sequence` named `randomized()` that will rearrange the elements in a somewhat random order. You can test out your implementation on an ordinary `Array`, which implements `Sequence`.
 
 Hints:
 
 * Your method signature should be `randomized() -> [Iterator.Element]`. The type `[Iterator.Element]` is an array of whatever type the `Sequence` holds, such as `String` or `Int`, .
 * You can call the `arc4random_uniform()` method like this: `arc4random_uniform(2)` to randomly generate a 1 or 0 for your randomization algorithm.
*/

extension Sequence {
  func randomized() -> [Iterator.Element] {
    return self.sorted { _ in
      arc4random_uniform(2) == 0
    }
  }
}

let ordered = [1, 2, 3, 4, 5, 6, 7, 8, 9]

// Try it a few times. Not really that random, but still!

ordered.randomized()
ordered.randomized()
ordered.randomized()
ordered.randomized()
