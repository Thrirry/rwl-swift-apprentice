//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"
print()

/*
 Mini-exercises
 1. Write a function named printFullName that takes two strings called firstName and lastName. The function should print out the full name defined as firstName + " " + lastName. Use it to print out your own full name.
 */
func printFullName(_ firstName: String, _ lastName: String){
    print("\(firstName) \(lastName)")
}
printFullName("Hoff","Silva")

/*
 2. Change the declaration of printFullName to have no external name for either parameter.
 */
//Done

/*
 3. Write a function named calculateFullName that returns the full name as a string. Use it to store your own full name in a constant.
 */
func calculateFullName(_ firstName: String, _ lastName: String) -> String{
    return firstName + " " + lastName
}
var fullName = calculateFullName("Hoff", "Silva")
print(fullName)
/*
 4. Change calculateFullName to return a tuple containing both the fullname and the length of the name. You can find a string’s length by using the following syntax: string.characters.count. Use this function to determine the length of your own full name.
 */

func calculatedFullName(_ firstName: String, _ lastName: String) -> (fullName: String, lenghtOfFullName: Int){
    
    return (firstName + " " + lastName, (firstName + " " + lastName).characters.count)
}
let fullNamed = calculatedFullName("Hoff", "Silva")
print(fullNamed.fullName)
print(fullNamed.lenghtOfFullName)


//Challenges
/*
 Challenge A: Looping with stride functions
 In the last chapter you wrote some for-loops with ranges. Ranges are limited in that they must always be increasing. The Swift stride(from:to:by:) and stride(from:through:by:) functions let you loop much more flexibly. For example, if you wanted to loop from 10 to 20 by 4s you can write:
 
 for index in stride(from: 10, to: 22, by: 4) {
 print(index)
 }
 // prints 10, 14, 18
 for index in stride(from: 10, through: 22, by: 4) {
 print(index)
 }
 // prints 10, 14, 18, and 22
 
 • What is the difference between the two stride function overloads?
 
 Os parametros, a primeira funciona como um range fechado, e a segunda como um range meio aberto.
 
 • Write a loop that goes from 10.0 to (and including) 9.0, decrementing by 0.1.
 */
for item in stride(from: 10, through: 9, by: -0.1) {
    print(item)
}

/*
 Challenge B: It’s prime time
 When I’m acquainting myself with a programming language, one of the first things I do is write a function to determine whether or not a number is prime.
 That’s your first challenge.
 
 First, write the following function:
 
 func isNumberDivisible(_ number: Int, by divisor: Int) -> Bool
 You’ll use this to determine if one number is divisible by another. 
 It should return true when number is divisible by divisor.
 Hint: You can use the modulo (%) operator to help you out here. Next, write the main function:
 func isPrime(_ number: Int) -> Bool
 
 This should return true if number is prime, and false otherwise. A number is prime if it’s only divisible by 1 and itself. 
 
 You should loop through the numbers from 1 to the number and find the number’s divisors. If it has any divisors other than 1 and itself, then the number isn’t prime. You’ll need to use the isNumberDivisible(_:by:) function you wrote earlier.
 Use this function to check the following cases:
 isPrime(6) // false
 isPrime(13) // true
 isPrime(8893) // true
 
 Hint 1: Numbers less than 0 should not be considered prime. Check for this case at the start of the function and return early if the number is less than 0.
 
 Hint 2: Use a for loop to find divisors. If you start at 2 and end before the number itself, then as soon as you find a divisor, you can return false.
 
 Hint 3: If you want to get really clever, you can simply loop from 2 until you reach the square root of number rather than going all the way up to number itself. I’ll leave it as an exercise for you to figure out why. It may help to think of the number 16, whose square root is 4. The divisors of 16 are 1, 2, 4, 8 and 16.
 */

func isNumberDivisible(_ number: Int, by divisor: Int) -> Bool{
    if number % divisor == 0 {
        return true
    }else{
        return false
    }
}


func isPrime(_ number: Int) -> Bool{
    var count = 1
    var numberPrime = 0
    while count <= number {
        if number % count == 0 {
            numberPrime += 1
        }
        count += 1
    }
    if numberPrime == 2 {
        return true
    }else{
        return false
    }
}
print(isPrime(8893))

/*
 Challenge C: Recursive functions
 In this challenge, you're going to see what happens when a function calls itself, a behavior called RECURSION. This may sound unusual, but it can be quite useful.
 Your're going to write a function that computes a value from the fibonnaci sequence. Any value in the sequence is the sum of the previous two values. Th e sequence is defined such that the first two values equal 1. That is, fibonnaci(1) =  1 and fibonnaci(2) = 1.
 
 Write your function using the following declaration:
 
 func fibonnaci(_ number: Int) -> Int
 
 Then, verify you've written the function correctly by executing it with the following numbers:
 
 fibonnaci(1)
 fibonnaci(2)
 fibonnaci(3)
 fibonnaci(4)
 fibonnaci(5)
 fibonnaci(6)
 fibonnaci(7)
 
 Hint1 : to values less than 0 you should return 0
 
 Hint2: to start the seqence, hard-code a return value of 1 when a number equals 1
 
 Hint3 : for any other value, you will need to return the sum of calling fibonacci with number - 1 and number -2
 */

func fibonacci(_ number: Int) -> Int{
    if number == 1 || number == 2 {
        return 1
    }
    if number == 0{
        return 0
    }
    return fibonacci(number - 1) + fibonacci(number - 2)
    
}

fibonacci(0)


