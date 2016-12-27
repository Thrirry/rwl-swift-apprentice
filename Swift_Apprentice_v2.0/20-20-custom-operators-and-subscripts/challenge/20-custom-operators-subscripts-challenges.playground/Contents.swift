// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import CoreGraphics

/*:
 ## 20 Custom Operators and Subscripts
 ### Question 1
 1. Modify the following subscript implementation so that it compiles in a playground:
 
 ```swift
 extension Array {
   subscript(index: Int) -> (String, String)? {
     guard let value = self[index] as? Int else {
       return nil
     }
 
     switch (value >= 0, abs(value) % 2) {
       case (true, 0):
         return ("positive", "even")
       case (true, 1):
         return ("positive", "odd")
       case (false, 0):
         return ("negative", "even")
       case (false, 1):
         return ("negative", "odd")
       default:
         return nil
     }
   }
 }
 ```
 */

extension Array {
  subscript(index: Int, type: Bool) -> (String, String)? {
    guard let value = self[index] as? Int, type else {
      return nil
    }
    
    switch (value >= 0, abs(value) % 2) {
      case (true, 0):
        return ("positive", "even")
      case (true, 1):
        return ("positive", "odd")
      case (false, 0):
        return ("negative", "even")
      case (false, 1):
        return ("negative", "odd")
      default:
        return nil
    }
  }
}

let numbers = [-2, -1, 0, 1, 2]
numbers[0, true]
numbers[1, true]
numbers[2, false]
numbers[3, true]
numbers[4, true]


/*:
 ### Question 2
 Implement the exponentiation generic operator for float types so that the following code works:
 
 ```swift
 let exponent = 2
 let baseDouble = 2.0
 var resultDouble = baseDouble *** exponent
 let baseFloat: Float = 2.0
 var resultFloat = baseFloat *** exponent
 let base80: Float80 = 2.0
 var result80 = base80 *** exponent
 let baseCg: CGFloat = 2.0
 var resultCg = baseCg *** exponent
 ```
 **Note**: You should import the `CoreGraphics` framework in order to work with `CGFloat`:
 `import CoreGraphics`
 */

infix operator ***
func ***<T: FloatingPoint>(lhs: T, rhs: Int) -> T {
  var result = lhs
  for _ in 2...rhs {
    result *= lhs
  }
  return result
}

let exponent = 2
let baseDouble = 2.0
var resultDouble = baseDouble *** exponent
let baseFloat: Float = 2.0
var resultFloat = baseFloat *** exponent
let base80: Float80 = 2.0
var result80 = base80 *** exponent
let baseCg: CGFloat = 2.0
var resultCg = baseCg *** exponent

/*:
 ### Question 3
 
 Implement the exponentiation assignment generic operator for float types so that the following code works:
 
 ```swift
 resultDouble ***= exponent
 resultFloat ***= exponent
 result80 ***= exponent
 resultCg ***= exponent
 ```
*/

infix operator ***=
func ***=<T: FloatingPoint>(lhs: inout T, rhs: Int) {
  lhs = lhs *** rhs
}

resultDouble ***= exponent
resultFloat ***= exponent
result80 ***= exponent
resultCg ***= exponent
