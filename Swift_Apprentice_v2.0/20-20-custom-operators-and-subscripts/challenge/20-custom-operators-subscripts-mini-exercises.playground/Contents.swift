// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// Multiplication operator

infix operator **

func **(lhs: String, rhs: Int) -> String {
  var result = lhs
  for _ in 2...rhs {
    result += lhs
  }
  return result
}

let baseString = "abc"
let times = 5
var multipliedString = baseString ** times

// Multiplication assignment operator

infix operator **=

func **=(lhs: inout String, rhs: Int) {
  lhs = lhs ** rhs
}

multipliedString **= times
