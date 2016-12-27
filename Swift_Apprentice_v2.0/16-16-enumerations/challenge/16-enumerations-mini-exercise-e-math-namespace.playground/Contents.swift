// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

// The constant *e* is useful in calculations for statistical bell curves and compound growth rates. Add *e* to your `Math` namespace.

enum Math {
  static let e = 2.7183
  
  static func factorial(of number: Int) -> Int {
    return (1...number).reduce(1, *)
  }
  
}

let nestegg = 25000 * pow(Math.e, 0.07 * 20) // $101,380.95
