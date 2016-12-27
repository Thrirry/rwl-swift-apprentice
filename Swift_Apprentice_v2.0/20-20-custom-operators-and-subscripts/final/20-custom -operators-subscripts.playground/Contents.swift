// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

precedencegroup ExponentiationPrecedence {
  associativity: right
  higherThan: MultiplicationPrecedence
}

infix operator **: ExponentiationPrecedence

func **<T: Integer>(lhs: T, rhs: Int) -> T {
  var result = lhs
  for _ in 2...rhs {
    result *= lhs
  }
  return result
}

let base = 2
let exponent = 2
let result = base ** exponent

infix operator **=

func **=<T: Integer>(lhs: inout T, rhs: Int) {
  lhs = lhs ** rhs
}

var number = 2
number **= exponent

let unsignedBase: UInt = 2
let unsignedResult = unsignedBase ** exponent

let base8: Int8 = 2
let result8 = base8 ** exponent

let unsignedBase8: UInt8 = 2
let unsignedResult8 = unsignedBase8 ** exponent

let base16: Int16 = 2
let result16 = base16 ** exponent

let unsignedBase16: UInt16 = 2
let unsignedResult16 = unsignedBase16 ** exponent

let base32: Int32 = 2
let result32 = base32 ** exponent

let unsignedBase32: UInt32 = 2
let unsignedResult32 = unsignedBase32 ** exponent

let base64: Int64 = 2
let result64 = base64 ** exponent

let unsignedBase64: UInt64 = 2
let unsignedResult64 = unsignedBase64 ** exponent

2 * 2 ** 3 ** 2
2 * (2 ** (3 ** 2))

class Person {
  let name: String
  let age: Int
  
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
}
let me = Person(name: "Cosmin", age: 30)

extension Person {
  subscript(key: String) -> String? {
    switch key {
    case "name":
      return name
    case "age":
      return "\(age)"
    default:
      return nil
    }
  }
}

me["name"]
me["age"]
me["gender"]
