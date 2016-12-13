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

//shft right >> é o memso que a potencia de base dois na DIVISAO
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
var exercisesSolved = 0

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

let position : Int = 63
let row : Int = position / 8
let colmn : Int = position / 8








