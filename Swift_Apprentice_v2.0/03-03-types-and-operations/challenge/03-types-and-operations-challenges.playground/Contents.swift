// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)
import Foundation

/*:
 ## Types and Operations
 ### Question 1
 Create a constant called `coordinates` and assign a tuple containing two and three to it.
 */
let coordinates = (2, 3)

/*:
 ## Types and Operations
 ### Question 2
 Create a constant called `namedCoordinate` with a `row` and `column` component of 2 and 3.
 */
let namedCoordinate = (row: 2, column: 3)

/*:
 ### Question 3
 Which of the following are valid statements?
*/

//let character: Character = "Dog" // INVALID
//let character: Character = "🐶" // VALID
//let string: String = "Dog" // VALID
//let string: String = "🐶" // VALID

/*:
 ### Question 4
 Is this valid code?
*/
let tuple = (day: 15, month: 8, year: 2015)
//let day = tuple.Day // Invalid because it should be 'day' instead of 'Day'
/*:
 ### Question 5
 What is wrong with the following code?
*/
let name = "Matt"
//name += " Galloway" // 'name' is a constant, so you can't change its value
/*:
 ### Question 6
 What is the type of the constant called `value`?
 */
let tuple1 = (100, 1.5, 10)
let value = tuple1.1 // value = 1.5 of type Double

/*:
 ### Question 7
 What is the value of the constant called `month`?
*/
let tuple2 = (day: 15, month: 8, year: 2015)
let month = tuple2.month // month = 8

/*:
 ### Question 8
 What is the value of the constant called `summary`?
 */
let number = 10
let multiplier = 5
let summary = "\(number) multiplied by \(multiplier) equals \(number * multiplier)"
// summary = "10 multiplied by 5 equals 50"

/*:
 ### Question 9
  What is the sum of `a`, `b` minus `c`?
 */
let a = 4
let b: Int32 = 100
let c: UInt8 = 12
let answer = a + Int(b) - Int(c)
/*:
 ### Question 10
 What is the difference between `Double.pi` and `Float.pi`?
 */
let difference = Double.pi - Double(Float.pi)

// Float is a little less accurate so it makes sense to promote it to
// a Double. Double is more accurate but it is not exact! That 
// would require an infinite number of bits. :]
//
// 1.50995798975373e-07

