// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import CoreGraphics

/*:
 ## Error Handling Challenges
 ### Question 1
 
`CGAffineTransform` is a transform type used by Core Graphics and used to scale, rotate graphical elements.  You can obtain an inverse transform by calling the `inverted()` method. 
 
    Just like dividing by zero fails, inverting a singular transform can fail.  (When this happens `CGAffineTransform` does nothing to warn you except print a message to the console. You can do better.
 
    The following code that checks whether a transform can be inverted or will fail.

```swift
 extension CGAffineTransform {
   var isInvertable: Bool {
       return abs(a*d - b*c) > CGFloat.ulpOfOne
     }
   }
 
 CGAffineTransform().isInvertable  // false
 CGAffineTransform.identity.isInvertable // true
 
```
 
 Use the following code make viewing transforms easy:
 
 ```swift
 extension CGAffineTransform: CustomStringConvertible {
   public var description: String {
     return [a,b,c,d,tx,ty].reduce("") { $0 + " \($1)" }
   }
 }
```
 
 Write a method on `CGAffineTransform` called `safeInverted()` that returns an optional type. If the transform can be inverted it returns the new transform.  Otherwise it returns `nil`.
 
 Test your method with `let scaleByTwo = CGAffineTransform.identity.scaledBy(x: 2, y: 2)` and observe the values you get back.
 
 */

// For nice debug printing
extension CGAffineTransform: CustomStringConvertible {
  public var description: String {
    return [a,b,c,d,tx,ty].reduce("") { $0 + " \($1)" }
  }
}

// A method to detect singular transforms
extension CGAffineTransform {
  var isInvertable: Bool {
    return abs(a*d - b*c) > CGFloat.ulpOfOne
  }
}

// Safe way to
extension CGAffineTransform {
  func safeInverted() -> CGAffineTransform? {
    return isInvertable ? inverted() : nil
  }
}
let singular = CGAffineTransform()
let scaleByTwo = CGAffineTransform.identity.scaledBy(x: 2, y: 2)
let scaleByHalf = scaleByTwo.safeInverted()


/*:
 ### Question 2
 
Use optional chaning to safely invert the transform and then invert it again.  (Much like taking the recipricol of the same number, you should wind up with the same number.)
 */

let thereAndBackAgain = scaleByTwo.safeInverted()?.safeInverted()

/*:
 ### Question 3
 
 Change your above design to throw MathError.singular error if the transform can't be inverted.  Call this new method `checkedInverted()` so it can co-exist nicely with your `safeInverted()` method.  Test it out.
 */

enum MathError: Error {
  case singular
}

extension CGAffineTransform {
  func checkedInverted() throws -> CGAffineTransform {
    guard isInvertable else {
      throw MathError.singular
    }
    return inverted()
  }
}

do {
  let scaled = try scaleByTwo.checkedInverted()
//  let scaled2 = try singular.checkedInverted()
}
catch MathError.singular {
  print("error")
}

/*: 
 ### Question 4
 Notice the return types of `safeInverted()` and `checkedInverted()`.  How do they differ?
 */

// safeInverted returns an optional type where checkedInverted returns a transform that is valid within the scope that it was tried.  Note that if your function throws you don't need to make the return type optional.

