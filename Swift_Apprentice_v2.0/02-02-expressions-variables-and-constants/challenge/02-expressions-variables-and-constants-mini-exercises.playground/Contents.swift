// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)
import Foundation

/*: 
 ## Expressions, Variables & Constants Mini-exercises
 ### Question 1
Declare a constant of type `Int` called `myAge` and set it to your age.
 */
 
let myAge: Int = 25

/*:
 ### Question 2
 Declare a variable of type `Double` called `averageAge`. Initially, set it to your own age. Then, set it to the average of your age and my own age of `30`.
 */

var averageAge: Double = 25
averageAge = (averageAge + 30) / 2

/*:
 ### Question 3
 Create a constant called `testNumber` and initialize it with whatever integer you’d like. Next, create another constant called `evenOdd` and set it equal to `testNumber` modulo 2. Now change `testNumber` to various numbers. What do you notice about `evenOdd`?
 */

let testNumber: Int = 42
let evenOdd = testNumber % 2
// 'evenOdd' is 0 when 'testNumber' is even. 'evenOdd' is 1 when 'testNumber' is odd.

/*:
 ### Question 4
 Create a variable called `answer` and initialize it with the value `0`. Increment it by `1`. Add `10` to it. Multiply it by `10`. Then, shift it to the right by `3`. After all of these operations, what’s the answer?
 */
var answer: Int = 0
answer += 1
answer += 10
answer *= 10
answer >>= 3
answer
// answer = 13
