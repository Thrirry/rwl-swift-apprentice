//: Playground - noun: a place where people can play
import Foundation
/*Mini-exercises
 
1. Create a constant called myAge and set it to your age. Then, create a constant called isTeenager that uses Boolean logic to determine if the age denotes someone in the age range of 13 to 19.
*/
let myAge = 30
var isTeenager = myAge < 19 && myAge > 13

/*
 2. Create another constant called theirAge and set it to myage, which is 30. Then, create a constant called bothTeenagers that uses Boolean logic to determine if both you and I are teenagers.
 */
let theirAge = 30
let bothTeenagers = (myAge < 19 && myAge > 13) && (theirAge < 19 && theirAge > 13)

/*
 3. Create a constant called reader and set it to your name as a string. Create a constant called author and set it to my name, Matt Galloway. Create a constant called authorIsReader that uses string equality to determine if reader and author are equal.
 */
let reader  = "Hoff"
let author = "Matt Galloway"
let authorIsReader = reader == author

/*
 4. Create a constant called readerBeforeAuthor which uses string comparison to determine if reader comes before author.
 */
let readerBeforeAuthor = reader < author

//Encapsulating variables

//You earn $25 for every hour up to 40 hours, and $50 for every hour thereafter.

var hoursWorked = 45
var price = 0
if hoursWorked > 40 {
    let hoursOver40 = hoursWorked - 40
    price += hoursOver40 * 50
    hoursWorked -= hoursOver40
}
price += hoursWorked * 25
print(price)

/*
 Mini-exercises
 1. Create a constant called myAge and initialize it with your age. Write an if statement to print out Teenager if your age is between 13 and 19, and Not a teenager if your age is not between 13 and 19.
 */

if myAge < 19 && myAge > 13 {
    isTeenager = true
    print(isTeenager)
}

/*
 2. Create a constant called answer and use a ternary condition to set it equal to the result you print out for the same cases in the above exercise. Then print out answer.
 */
let answer = myAge < 19 && myAge > 13 ? true : false


/*
 Mini-exercises
 1. Create a variable named counter and set it equal to 0.Create a while loop with the condition counter < 10 which prints out counter is X (where X is replaced with counter value) and then increments counter by 1.
 */
var counter = 0
while counter < 10 {
    print(counter)
    counter += 1
}

/*
 2. Create a variable named counter and set it equal to 0.Create another variable named roll and set it equal to 0. Create a repeat-while loop. Inside the loop, set roll equal to Int(arc4random_uniform(6)) which means to pick a random number between 0 and 5. Then increment counter by 1. Finally, print After X rolls, roll is Y where X is the value of counter and Y is the value of roll. Set the loop condition such that the loop finishes when the first 0 is rolled.
 */

var roll = 0
counter = 0
repeat{
    roll = Int(arc4random_uniform(6))
    print("X: \(counter) Y: \(roll)")
    counter += 1
}while roll != 0

/*
 Challenges
 1. What’swrongwiththefollowingcode?
 
 let firstName = "Matt"
 
 if firstName == "Matt" {
    let lastName = "Galloway"
 } else if firstName == "Ray" {
    let lastName = "Wenderlich"
 }
    let fullName = firstName + " " + lastName
 If firstName dont be equals to "Matt" or "Ray", lastName dont will exists
 
 2. In each of the following statements,what is the value of the Boolean answer constant?
 let answer = true && true //TRUE
 let answer = false || false //FALSE
 let answer = (true && 1 != 2) || (4 > 3 && 100 < 1) //TRUE
 let answer = ((10 / 2) > 3) && ((10 % 2) == 0) //TRUE
 
 3. Suppose the squares on a chessboard are numbered left to right,top to bottom, with 0 being the top-left square and 63 being the bottom-right square. Rows are numbered top to bottom, 0 to 7. Columns are numbered left to right, 0 to 7. Given a current position on the chessboard, expressed as a row and column number, calculate the next position on the chessboard, again expressed as a row and column number. The ordering is determined by the numbering from 0 to 63. The position after 63 is again 0.
 */

let position = 70
var row = position / 8
var column = position % 8
row += 1
column += 1
var newRow = row > 7 ? row - 8 : row
var newColumn = column > 7 ? column - 8 : column

/*
 Given the coefficients a,b and c,calculate the solutions to a quadratic equation with these coefficients. Take into account the different number of solutions (0, 1 or 2)
 Δ = bˆ2 - 4 * a * c
 x = - (b) + - sqrt(Δ)/2 * a
 */
let a = Int(arc4random_uniform(100))
let b = Int(arc4random_uniform(100))
let c = Int(arc4random_uniform(100))

var delta = (b*b) - (4 * a * c)

if delta > 0 {
    let x1 = (-(Double(b)) + (sqrt(Double(delta)))) / 2 * Double(a)
    let x2 = (-(Double(b)) - (sqrt(Double(delta)))) / 2 * Double(a)
    print("X1: \(x1) \nX2: \(x2)")
}
if delta == 0 {
    let x = -(b)/2 * a
    print("X = \(x)")
}

if delta < 0 {
    print("A equacao possui raizes reias distintas complexas")
}

/*
 5. Given a month(represented with a String in all lowercase) and the current year (represented with an Int), calculate the number of days in the month. Remember that because of leap years, "february" has 29 days when the year is a multiple of 4 but not a multiple of 100. February also has 29 days when the year is a multiple of 400.
 */
let month = "february"
let year = 2016
year % 100 != 0
year % 4 == 0
year % 400 == 0

if month == "january" {
    print("January has 31 days")
}else if month == "february" && (year % 4 == 0 && year % 100 != 0 && year % 400 == 0){
    print("February has 29 days")
}else{
    print("February has 28 days")
}








		