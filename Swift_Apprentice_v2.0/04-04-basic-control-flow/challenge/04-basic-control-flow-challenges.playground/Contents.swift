// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)
import Foundation

/*:
 ## Basic Control Flow
 ### Question 1
 What’s wrong with the following code?
 
     let firstName = "Matt"
 
     if firstName == "Matt" {
         let lastName = "Galloway"
     } else if firstName == "Ray" {
         let lastName = "Wenderlich"
     }
     let fullName = firstName + " " + lastName
*/
// `lastName` is not visible to the scope when setting `fullName`.
// A correct solution:
let firstName = "Matt"
var lastName = ""

if firstName == "Matt" {
  lastName = "Galloway"
} else if firstName == "Ray" {
  lastName = "Wenderlich"
}

let fullName = firstName + " " + lastName


/*:
 ### Question 2
 In each of the following statements, what is the value of the Boolean `answer` constant?
 */

let answer4 = true && true
// true

let answer5 = false || false
// false

let answer6 = (true && 1 != 2) || (4 > 3 && 100 < 1)
// true

let answer7 = ((10 / 2) > 3) && ((10 % 2) == 0)
// true

/*:
 ### Question 3
 Suppose the squares on a chessboard are numbered left to right, top to bottom, with 0 being the top-left square and 63 being the bottom-right square. Rows are numbered top to bottom, 0 to 7. Columns are numbered left to right, 0 to 7. Given a current position on the chessboard, expressed as a row and column number, calculate the next position on the chessboard, again expressed as a row and column number. The ordering is determined by the numbering from 0 to 63. The position after 63 is again 0.
 */
let row = 7
let column = 7

var nextRow = row
var nextColumn = column + 1
if nextColumn > 7 {
    nextColumn = 0
    nextRow += 1
}
if nextRow > 7 {
    nextRow = 0
}
print("The position after (\(row), \(column)) is (\(nextRow), \(nextColumn))")

/*: 
 ### Question 4
 Given the coefficients a, b and c, calculate the solutions to a quadratic equation with these coefficients. Take into account the different number of solutions (0, 1 or 2). If you need a math refresher, this Wikipedia article on the quadratic equation will help [https://en.wikipedia.org/wiki/Quadratic_formula](https://en.wikipedia.org/wiki/Quadratic_formula).
 */

let a = 1.0
let b = -5.0
let c = 6.0

let d = b * b - 4 * a * c
if d > 0 {
    let x1 = (-b + sqrt(d)) / (2 * a)
    let x2 = (-b - sqrt(d)) / (2 * a)
    print("The solutions are \(x1) and \(x2)")
} else if d == 0 {
    let x = -b / (2 * a)
    print("Both solutions are \(x)")
} else {
    print("This equation has no solutions")
}

/*:
 ### Question 5
Given a month (represented with a `String` in all lowercase) and the current year (represented with an `Int`), calculate the number of days in the month. Remember that because of leap years, "february" has 29 days when the year is a multiple of 4 but not a multiple of 100.  February also has 29 days when the year is a multiple of 400.
 */

let month = "february"
let year = 2016

if month == "january" || month == "march" || month == "may" || month == "july" || month == "august" || month == "october" || month == "december" {
    print("This month has 31 days")
} else if month == "april" || month == "june" || month == "september" || month == "november" {
    print("This month has 30 days")
} else if month == "february" && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
    print("This month has 29 days")
} else if month == "february" {
    print("This month has 28 days")
} else {
    print("This is not a valid month")
}

/*:
 ### Question 6
 Given a number, determine if this number is a power of 2. (Hint: you can use `log2(number)` to find the base 2 logarithm of `number`. `log2(number)` will return a whole number if `number` is a power of two. You can also solve the problem using a loop and no logarithm.)
 */
let number = 1024.0
/*:
 Solution using logarithms:
 */
let log = log2(number)
if log == Double(Int(log)) {
    print("\(number) is a power of 2")
} else {
    print("\(number) is not a power of 2")
}
/*:
 Solution without using logarithms:
 */
var dividend = number
while dividend.truncatingRemainder(dividingBy: 2) == 0 {
    dividend /= 2
}
if dividend == 1 {
    print("\(number) is a power of 2")
} else {
    print("\(number) is not a power of 2")
}

/*:
 ### Question 7
 Print a table of the first 10 powers of 2.
 */
var exponent = 0
var power = 1
while exponent <= 10 {
    print("\(exponent)\t\(power)")
    exponent += 1
    power *= 2
}

/*:
 ### Question 8
 Given a number n, calculate the n-th Fibonacci number.  (Recall Fibonacci is 1, 1, 2, 3, 5, 8, 13, ... Start with 1 and 1 and add these values together to get the next value.  The next value is the sum of the previous two.  So the next value in this case is 8+13 = 21.)
 */
let goal = 10  // the value of n

var current = 1
var previous = 1
var done = 2
while done < goal {
    let next = current + previous
    previous = current
    current = next
    done += 1
}
print("Fibonacci number \(goal) is \(current)")

/*:
 ### Question 9
 Given a number n, calculate the factorial of n.  (Example: 4 factorial is equal to 1 * 2 * 3 * 4.)
 */

let n = 5

var accumulator = 1
done = 1
while done < n {
    done += 1
    accumulator *= done
}
print("\(n)! is \(accumulator)")

/*:
 ### Question 10
 Given a number between 2 and 12, calculate the odds of rolling this number using two six-sided dice. Compute it by exhaustively looping through all of the combinations and counting the fraction of outcomes that give you that value. Don't use a formula.
 */
let targetValue = 7

var combinationsFound = 0
var valueOnFirstDice = 1
while valueOnFirstDice <= 6 {
    var valueOnSecondDice = 1
    while valueOnSecondDice <= 6 {
        if valueOnFirstDice + valueOnSecondDice == targetValue {
            combinationsFound += 1
        }
        valueOnSecondDice += 1
    }
    valueOnFirstDice += 1
}
let percentage = Int(Double(combinationsFound) / 36 * 100)
print("The odds of rolling a \(targetValue) are \(combinationsFound) in 36 or \(percentage)%")
