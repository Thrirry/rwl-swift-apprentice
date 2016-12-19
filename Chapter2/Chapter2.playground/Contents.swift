//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//imprimindo a variavel
print(str)

//simple operations
//Add
2 + 6
//subtract
10 - 2
//multiply
2 * 4
//divide
16 / 2

//decimal numbers

22/7
//decimal correct
22.0 / 7

//o resto da divisao

22%7

// shift operations
//shift left << é o mesmo que a potencia de base dois na MULTIPLICACAO
// 1 << 3 é a mesma coisa que 1 * 2ˆ3
1 << 3

//shift right >> é o memso que a potencia de base dois na DIVISAO
// 32 << 1 é a mesma coisa que 32 / 2ˆ1
32 >> 1

//o numero de pi
Double.pi

//Constants
let number : Int = 10
let pi: Double = 3.14159

//variable number
var numero : Int = 1_000_000
print(numero)

//Increment add
var incrementADD : Int = 0
incrementADD += 1
//Decrement sub
var decrementSUB : Int = 0
incrementADD -= 1

//Increment mult
var incrementMULT : Int = 1
incrementMULT *= 2
//Decrement div
var decrementDIV : Int = 2
decrementDIV /= 2

//_________________________________________________________________________________________________/

let myAge : Int = 30
var averageAge : Double = 30.0
averageAge = Double((myAge + 30)/2)
let testNumber : Int = 13
let evenOdd = testNumber % 2
var answer = 0
answer += 1
answer = answer + 10
answer = answer * 10
answer >> 3

let exercises = 11
var exercisesSolved = 1

/*
 
 2. Giventhefollowingcode:
 age = 16
 print(age)
 age = 30
 print(age)
 Declareagesothatitcompiles. Didyouusevarorlet?
 
 */
var age : Int
age = 16
print(age)
age = 30
print(age)

exercisesSolved += 1

/*
 
 3. Considerthefollowingcode:
 let a: Int = 46
 let b: Int = 1
 Work out what answer equals when you replace the final line of code above with each of these options:
 // 1
 let answer1: Int = (a * 100) + b
 // 2
 let answer2: Int = (a * 100) + (b * 100)
 // 3
 let answer3: Int = (a * 100) + (b / 10)
 
 */
let a: Int = 46
let b: Int = 1

// 1
let answer1: Int = (a * 100) + b
// 2
let answer2: Int = (a * 100) + (b * 100)
// 3
let answer3: Int = (a * 100) + (b / 10)

exercisesSolved += 1

/*
 
 4. Addparenthesestothefollowingcalculation.Theparenthesesshouldshowthe order in which the operations are performed and should not alter the result of the calculation.
 5*3-4/2*2
 
 */
5*3-(4/2)*2
exercisesSolved += 1

/*
 
 5. Declare two constants a and b of type Double and assign both a value.Calculate
 the average of a and b and store the result in a constant named average.
 
 */
let c : Double = 25.0
let d : Double = 33.0
let average = (c + d)/2
exercisesSolved += 1


/*
 
 6. A temperature expressed in °C can be converted to °F by multiplying by 1.8 then incrementing by 32. In this challenge, do the reverse: convert a temperature from °F to °C. Declare a constant named fahrenheit of type Double and assign it a value. Calculate the corresponding temperature in °C and store the result in a constant named celcius.
 
 */

let fahrenheit : Double = 145
let celcius : Double = (fahrenheit - 32) / 1.8
exercisesSolved += 1

/*
 
 7. Suppose the squares on a chessboard are numbered left to right,top to bottom, with 0 being the top-left square and 63 being the bottom-right square. Rows are numbered top to bottom, 0 to 7. Columns are numbered left to right, 0 to 7.
    Declare a constant position and assign it a value between 0 and 63. Calculate the corresponding row and column numbers and store the results in constants named row and column.
 
 */

let position : Int = 61
print("Column: \(position % 8)")
print("Row: \(position / 8)")
exercisesSolved += 1

/*
 
 8. Declare constants named dividend and divisor of type Double and assign both a value. Calculate the quotient and remainder of an integer division of dividend by divisor and store the results in constants named quotient and remainder. Calculate the remainder without using the operator %.
 
 */

let dividend : Double = 10
let divisor : Double = 33
var quotient : Double = 0
var remainder : Double = 0

quotient = dividend/divisor
remainder = dividend - (divisor*quotient)
exercisesSolved += 1

/*
 
 9. A circle is made up of 2pi radians,corresponding with 360 degrees.Declare a constant degrees of type Double and assign it an initial value. Calculate the corresponding angle in radians and store the result in a constant named radians.
 
 */
let degrees : Double = 100
let radians = (degrees*pi)/180
exercisesSolved += 1

/*
 
 10. Declare four constants named x1, y1, x2 and y2 of type Double. These constants represent the 2-dimensional coordinates of two points. Calculate the distance between these two points and store the result in a constant named distance.
 
 */
let x1 : Double = 5
let y1 : Double = 2
let x2 : Double = 8
let y2 : Double = 4
let distance = sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2))
exercisesSolved += 1

/*
 
 11. Increment variable exercisesSolved a final time. Use the print function to print the percentage of exercises you managed to solve. The printed result should be a number between 0 and 1.
 
 */
exercisesSolved += 1

let percentageOfSolvedExercises = exercisesSolved/11

print(percentageOfSolvedExercises)
















