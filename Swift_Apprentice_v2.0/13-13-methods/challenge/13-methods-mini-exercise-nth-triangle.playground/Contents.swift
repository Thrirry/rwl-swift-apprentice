// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

// Add a type method to the `Math` structure that calculates the nth triangle number. It will be very similar to the factorial formula, except instead of multiplying the numbers, you add them.

struct Math {
  static func factorial(of number: Int) -> Int {
    return (1...number).reduce(1, *)
  }
  static func triangleNumber(n: Int) -> Int {
    return (1...n).reduce(0, +)
  }
}

let fiveFactorial = Math.factorial(of: 5) // 120
let nthTriangle = Math.triangleNumber(n: 6) // 21
