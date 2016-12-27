// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// BASICS
var multiplyClosure: (Int, Int) -> Int

multiplyClosure = { (a: Int, b: Int) -> Int in
  return a * b
}
let result = multiplyClosure(4, 2)

multiplyClosure = { (a: Int, b: Int) -> Int in
  a * b
}

multiplyClosure = { (a, b) in
  a * b
}

multiplyClosure = {
  $0 * $1
}

func operateOnNumbers(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
  let result = operation(a, b)
  print(result)
  return result
}

let addClosure = { (a: Int, b: Int) in
  a + b
}
operateOnNumbers(4, 2, operation: addClosure)

func addFunction(_ a: Int, _ b: Int) -> Int {
  return a + b
}
operateOnNumbers(4, 2, operation: addFunction)

operateOnNumbers(4, 2, operation: { (a: Int, b: Int) -> Int in
  return a + b
})

operateOnNumbers(4, 2, operation: { $0 + $1 })

operateOnNumbers(4, 2, operation: +)

operateOnNumbers(4, 2) {
  $0 + $1
}

let voidClosure: () -> Void = {
  print("Swift Apprentice is awesome!")
}
voidClosure()

var counter = 0
let incrementCounter = {
  counter += 1
}
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()

func countingClosure() -> (() -> Int) {
  var counter = 0
  let incrementCounter: () -> Int = {
    counter += 1
    return counter
  }
  return incrementCounter
}

let counter1 = countingClosure()
let counter2 = countingClosure()

counter1() // 1
counter2() // 1
counter1() // 2
counter1() // 3
counter2() // 2

// SORTING
let names = ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]
names.sorted()

let sortedByLength = names.sorted {
  $0.characters.count > $1.characters.count
}
sortedByLength

// FUNCTIONAL
var prices = [  1.5, 10, 4.99, 2.30, 8.19]

let largePrices = prices.filter {
  return $0 > 5
}

let salePrices = prices.map {
  return $0 * 0.9
}

let sum = prices.reduce(0) {
  return $0 + $1
}

let stock = [1.5:5, 10:2, 4.99:20, 2.30:5, 8.19:30]
let stockSum = stock.reduce(0) {
  return $0 + $1.key * Double($1.value)
}

let removeFirst = prices.dropFirst()
let removeFirstTwo = prices.dropFirst(2)

let removeLast = prices.dropLast()
let removeLastTwo = prices.dropLast(2)

let firstTwo = prices.prefix(2)
let lastTwo = prices.suffix(2)
