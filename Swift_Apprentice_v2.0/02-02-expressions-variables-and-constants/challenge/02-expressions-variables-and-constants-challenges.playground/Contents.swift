// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)
import Foundation

/*: 
## Expressions, Variables & Constants Challenges

### Question 1
 Declare a constant `exercises` with value 11 and a variable `exercisesSolved` with value 0. Increment this variable every time you solve an exercise (including this one).
 */
let exercises = 11
var exercisesSolved = 0
exercisesSolved += 1
/*:
### Question 2
 Given the following code:
 ```swift
 age = 16
 print(age)
 age = 30
 print(age)
 ```
  Declare `age` so that it compiles.  Did you use `var` or `let`?
*/
var age: Int  // it is a var not a let
age = 16
print(age)
age = 30
print(age)
exercisesSolved += 1
/*:
### Question 3
 Consider the following code:

```swift
let a: Int = 46
let b: Int = 10
```
Work out what `answer` equals when you replace the final line of code above with each of these options:
```swift
// 1
let answer1: Int = (a * 100) + b
// 2
let answer2: Int = (a * 100) + (b * 100)
// 3
let answer3: Int = (a * 100) + (b / 10)
```
*/
let a: Int = 46
let b: Int = 10
let answer1: Int = (a * 100) + b
let answer2: Int = (a * 100) + (b * 100)
let answer3: Int = (a * 100) + (b / 10)
exercisesSolved += 1
/*:
### Question 4
 Add parentheses to the following calculation. The parentheses should show the order in which the operations are performed and should not alter the result of the calculation.
 */
5 * 3 - 4 / 2 * 2
/*:
 Solution:
 */
(5 * 3) - ((4 / 2) * 2)
exercisesSolved += 1
/*:
### Question 5
 Declare two constants `x` and `y` of type `Double` and assign both a value. Calculate the average of `x` and `y` and store the result in a constant named `average`.
 */
let x: Double = 7.5
let y: Double = 5
let average: Double = (x + y) / 2
exercisesSolved += 1
/*:
 Bonus: why is it important that `x` and `y` are of type `Double`?
 
 Solution:
 If `x` and `y` were of type `Int`, the result would be truncated to an `Int` as well.
*/

/*:
### Question 6
 A temperature expressed in °C can be converted to °F by multiplying by 1.8 then incrementing by 32. In this exercise, you will do the reverse: convert a temperature from °F to °C.
 
 Declare a constant named `fahrenheit` of type `Double` and assign it a value. Calculate the corresponding temperature in °C and store the result in a constant named `celcius`.
 */
let fahrenheit = 121.0
let celcius = (fahrenheit - 32) / 1.8
exercisesSolved += 1

/*:
### Question 7
 Suppose the squares on a chessboard are numbered left to right, top to bottom, with 0 being the top-left square and 63 being the bottom-right square. Rows are numbered top to bottom, 0 to 7. Columns are numbered left to right, 0 to 7.
 
 Declare a constant `position` and assign it a value between 0 and 63. Calculate the corresponding row and column numbers and store the results in constants named `row` and `column`.
 */
let position = 54
let row = position / 8
let column = position % 8
exercisesSolved += 1

/*:
 ### Question 8
 Declare constants named `dividend` and `divisor` of type `Double` and assign both a value. Calculate the quotient and remainder of an integer division of `dividend` by `divisor` and store the results in constants named `quotient` and `remainder`. Calculate the remainder without using the operator `%`.
 */

let dividend = 9.4
let divisor = 3.1
let quotient = Int(dividend / divisor)
let remainder = dividend - divisor * Double(quotient)
exercisesSolved += 1

/*:
 ### Question 9
 A circle is made up of 2𝜋 radians, corresponding with 360 degrees. Declare a constant `degrees` of type `Double` and assign it an initial value. Calculate the corresponding angle in radians and store the result in a constant named `radians`.
 */
let degrees = 360.0
let radians = (degrees / 180) * Double.pi
exercisesSolved += 1
/*:
### Question 10
 Declare four constants named `x1`, `y1`, `x2` and `y2` of type `Double`. These constants represent the 2-dimensional coordinates of two points. Calculate the distance between these two points and store the result in a constant named `distance`.
 */
let x1 = 1.0
let y1 = 1.0
let x2 = 3.0
let y2 = 3.0
let dx = x2 - x1
let dy = y2 - y1
let distance = sqrt(dx * dx + dy * dy)
exercisesSolved += 1
/*:
### Question 11
  Increment variable `exercisesSolved` a final time. Use the `print` function to print the percentage of exercises you managed to solve. The printed result should be a number between 0 and 1.
 */
exercisesSolved += 1
print(Double(exercisesSolved) / Double(exercises))
