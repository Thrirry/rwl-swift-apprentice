//: Playground - noun: a place where people can play

import UIKit
import Foundation

//Closures 

//Basic syntax

var multiplyClosure : (Int, Int) -> Int

multiplyClosure = {(a: Int, b: Int) -> Int in
    return a * b
}

let result = multiplyClosure(4, 2)

//Shorthand syntax

multiplyClosure = {(a : Int, b : Int) -> Int in
    //We don't need the 'return' when we have only one expression.
    a * b
}

multiplyClosure(3,2)

multiplyClosure = {(a, b) in
    a * b
}

multiplyClosure(2, 5)

multiplyClosure = {
    $0 * $1
}

multiplyClosure(3, 5)

func operateOnNumbers(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int{
    let result = operation(a, b)
    print(result)
    return result
}

let addClosure = {(a: Int, b: Int) in
    a + b
}
operateOnNumbers(4, 2, operation: addClosure)

func addFunction(_ a: Int, _ b: Int) -> Int{
    return a + b
}
operateOnNumbers(4, 2, operation: addFunction)

operateOnNumbers(4, 2, operation: {(a: Int, b: Int) -> Int in return a + b})

operateOnNumbers(4, 2, operation: {$0 + $1})

operateOnNumbers(4, 2, operation: +)

operateOnNumbers(4, 2){
    $0 + $1
}

//Closure with no return value

let voidClosure : () -> Void = {
    print("Swift apprentice is awesome!")
}
voidClosure()

//Capturing from the enclosing scope

var counter = 0
let incrementCounter = {
    counter += 1
}
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()

func countingClosure() -> (() -> Int){
    var counter = 0
    let incrementCounter : () -> Int = {
        counter += 1
        return counter
    }
    return incrementCounter
}

let counter1 = countingClosure()
let counter2 = countingClosure()

counter1()
counter2()
counter1()
counter1()
counter2()

//Custom sorting with closures
//Sort Arrays:
let names = ["zzzz", "sasa", "a", "ccc", "eeeee"]
names.sorted()

names.sorted{
    $0.characters.count < $1.characters.count
}

//Iterating over collections with closures

var prices = [1.5, 10, 4.99, 2.30, 8.19]
let largePrices = prices.filter{
    return $0 > 5
}

let salePrices = prices.map{
    return $0 * 0.9
}

let sum = prices.reduce(0){
    return $0 + $1
}

let stock = [1.5:5, 10:2, 4.99:20, 2.30:5, 8.19:30]
let stockSum = stock.reduce(0) {
    return $0 + $1.key*Double($1.value)
}

let removeFirst = prices.dropFirst()
let removeFirstTwo = prices.dropFirst(2)

let removeLast = prices.dropLast()
let removeLastTwo = prices.dropLast(2)

let firstTwo = prices.prefix(2)
let lastTwo = prices.suffix(2)

//Mini-exercises

// 1

let friendNames = ["hoff", "mariana", "judah", "marina"]
let linkedNames = friendNames.reduce("") {
    return $0 + $1
}

// 2

let linkedFourCharNames = friendNames.filter{
    return $0.characters.count > 5
    }.reduce(""){
        return $0 + $1
}

// 3

let namesAndAges = ["hoff" : 20, "mariana" : 27, "judah" : 30, "marina" : 24]
let ageUnder18 = namesAndAges.filter{
    return $0.value < 18
}

// 4
let ageThoseOlder10 = namesAndAges.filter{
    return $0.value >= 18
    }.map{
        return $0.key
}

//Challenges

// A - 
func repeatTask(times: Int, task: () -> Void){
    for _ in 0..<times{
        task()
    }
}

repeatTask(times: 5) {
    print("s")
}

// B









		