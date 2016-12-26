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
   // let hoursOver40 = hoursWorked - 40
  //  price += hoursOver40 * 50
//    hoursWorked -= hoursOver40
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
//var counter = 0
//while counter < 10 {
 //   print(counter)
   // counter += 1
//}

/*
 2. Create a variable named counter and set it equal to 0.Create another variable named roll and set it equal to 0. Create a repeat-while loop. Inside the loop, set roll equal to Int(arc4random_uniform(6)) which means to pick a random number between 0 and 5. Then increment counter by 1. Finally, print After X rolls, roll is Y where X is the value of counter and Y is the value of roll. Set the loop condition such that the loop finishes when the first 0 is rolled.
 */

var roll = 0
var counter = 0
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
 
let position = 70
var row = position / 8
var column = position % 8
row += 1
column += 1
var newRow = row > 7 ? row - 8 : row
var newColumn = column > 7 ? column - 8 : column
 */

/*
 Given the coefficients a,b and c,calculate the solutions to a quadratic equation with these coefficients. Take into account the different number of solutions (0, 1 or 2)
 Δ = bˆ2 - 4 * a * c
 x = - (b) + - sqrt(Δ)/2 * a
 
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
*/

/*
 5. Given a month(represented with a String in all lowercase) and the current year (represented with an Int), calculate the number of days in the month. Remember that because of leap years, "february" has 29 days when the year is a multiple of 4 but not a multiple of 100. February also has 29 days when the year is a multiple of 400.
 */
let month = "december"
let year = 2016
year % 100 != 0
year % 4 == 0
year % 400 == 0

if month == "january" {
    print("\(month) has 31 days")
}else if month == "february" {
    if year % 400 == 0{
         print("\(month) has 29 days")
    }else if year % 4 == 0 && year % 100 != 0{
         print("\(month) has 29 days")
    }else{
        print("\(month) has 28 days")
    }
}else if month == "march" {
    print("\(month) has 31 days")
}else if month == "april" {
    print("\(month) has 30 days")
}else if month == "may" {
    print("\(month) has 31 days")
}else if month == "june" {
    print("\(month) has 30 days")
}else if month == "july" {
    print("\(month) has 31 days")
}else if month == "august" {
    print("\(month) has 31 days")
}else if month == "september" {
    print("\(month) has 30 days")
}else if month == "october" {
    print("\(month) has 31 days")
}else if month == "november" {
    print("\(month) has 30 days")
}else if month == "december" {
    print("\(month) has 31 days")
}else{
    print("Mes inexistente!")
}

/*
 6. Given a number, determine if this number is a power of 2.(Hint: you can use log2(number) to find the base 2 logarithm of number. log2(number) will return a whole number if number is a power of two. You can also solve the problem using a loop and no logarithm.)
 */

log2(20.0)

/*
 7. Print a table of the first 10 powers of 2.
 */

/*var count = 0
var pot = 2
var count2 = 0

while count < 10 {
    if count == 0{
        print("2ˆ\(count) = 1")
        count += 1
    }else if count == 1{
        print("2ˆ\(count) = 2")
        count += 1
    }else{
        pot *= 2
        print("2ˆ\(count) = \(pot)")
        count += 1
    }
}
*/
/*
 8. Given a number n, calculate the n-th Fibonacci number. (Recall Fibonacci is 1, 1, 2, 3, 5, 8, 13, ... Start with 1 and 1 and add these values together to get the next value. The next value is the sum of the previous two. So the next value in this case is 8+13 = 21.)
 
var n = 100000000
var fibbo = 0
var countFibbo = 0
var ant = 1
var atu = 1
while countFibbo <= n {
    if ant == atu{
        print(1)
        print(1)
    }
    fibbo = ant + atu
    ant = atu
    atu = fibbo
    print(fibbo)
    countFibbo += 1
}
*/

/*
 9. Given a number n, calculate the factorial of n. (Example: 4 factorial is equal to 1 * 2 * 3 * 4.)
 */
print()
var numberToFat = 4
var fat = 1
var countFat = 1
while countFat <= numberToFat {
    fat *= countFat
    print(fat)
    countFat += 1
}

/*
 10. Given a number between 2 and 12, calculate the odds of rolling this number using two six-sided dice. Compute it by exhaustively looping through all of the combinations and counting the fraction of outcomes that give you that value. Don't use a formula.
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