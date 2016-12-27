// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// PULL OUT CODE INTO A SEPARATE FUNCTION
func printMyName() {
  print("My name is Matt Galloway.")
}
printMyName()


// FUNCTION PARAMETERS
func printMultipleOfFive(value: Int) {
  print("\(value) * 5 = \(value * 5)")
}
printMultipleOfFive(value: 10)

func printMultipleOf(multiplier: Int, andValue: Int) {
  print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}
printMultipleOf(multiplier: 4, andValue: 2)

func printMultipleOf(multiplier: Int, and value: Int) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(multiplier: 4, and: 2)

func printMultipleOf(_ multiplier: Int, and value: Int) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, and: 2)

func printMultipleOf(_ multiplier: Int, _ value: Int = 1) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, 2)

printMultipleOf(4)


// RETURN VALUES
func multiply(_ number: Int, by multiplier: Int) -> Int {
  return number * multiplier
}
let result = multiply(4, by: 2)

func multiplyAndDivide(_ number: Int, by factor: Int)
  -> (product: Int, quotient: Int) {
    return (number * factor, number / factor)
}
let results = multiplyAndDivide(4, by: 2)
let product = results.product
let quotient = results.quotient


// ADVANCED PARAMETER HANDLING
//func incrementAndPrint(_ value: Int) {
//  value += 1 // error: left side of mutating operator isn't mutable: 'value' is a 'let' constant
//  print(value)
//}

func incrementAndPrint(_ value: inout Int) {
  value += 1
  print(value)
}
var value = 5
incrementAndPrint(&value)
print(value)


// OVERLOADING
func getValue() -> Int {
  return 31;
}

func getValue() -> String {
  return "Matt Galloway"
}

//let value = getValue() // error: ambiguous use of 'getValue()'

let valueInt: Int = getValue()
let valueString: String = getValue()


// FUNCTIONS AS VARIABLES
func add(_ a: Int, _ b: Int) -> Int {
  return a + b
}

var function = add
function(4, 2)

func subtract(_ a: Int, _ b: Int) -> Int {
  return a - b
}
function = subtract
function(4, 2)

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
  let result = function(a, b)
  print(result)
}
printResult(add, 4, 2)

// LAND OF NO RETURN
//func noReturn() -> Never {
//
//}

func infiniteLoop() -> Never {
  while true {
  }
}
