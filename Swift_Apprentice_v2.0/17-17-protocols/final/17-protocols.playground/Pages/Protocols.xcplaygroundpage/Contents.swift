// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

//: ## Protocols

//: ### Protocol syntax

protocol Vehicle {
  func accelerate()
  func stop()
}

class Unicycle: Vehicle {
  var peddling = false
  
  func accelerate() {
    peddling = true
  }
  
  func stop() {
    peddling = false
  }
}

//: ### Methods in protocols

enum Direction {
  case left
  case right
}

protocol DirectionalVehicle {
  func accelerate()
  func stop()
  func turn(direction: Direction)
  func description() -> String
}

protocol OptionalDirectionVehicle {
  // Default parameters not allowed
  // func turn(direction: Direction = .left)
  
  func turn()
  func turn(direction: Direction)
}

//: ### Properties in protocols
protocol VehicleProperties {
  var weight: Int { get }
  var name: String { get set }
}
//: ### Initializers in protocols

protocol Account {
  var value: Double { get set }
  init(initialAmount: Double)
  init?(transferAccount: Account)
}

class BitcoinAccount: Account {
  var value: Double
  required init(initialAmount: Double) {
    value = initialAmount
  }
  required init?(transferAccount: Account) {
    guard transferAccount.value > 0.0 else {
      return nil
    }
    value = transferAccount.value
  }
}

var accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30.00)
let transferAccount = accountType.init(transferAccount: account)!

//: ## Protocol inheritance
protocol WheeledVehicle: Vehicle {
  var numberOfWheels: Int { get }
  var wheelSize: Double { get set }
}
//: ## Implementing Protocols
//class Bike: Vehicle {
//  var peddling: Bool = false
//  var brakesApplied: Bool = false
//  
//  func accelerate() {
//    peddling = true
//    brakesApplied = false
//  }
//  
//  func stop() {
//    peddling = false
//    brakesApplied = true
//  }
//}

//: ### Implementing properties

//class Bike: WheeledVehicle {
//  
//  let numberOfWheels = 2
//  var wheelSize = 16.0
//  
//  var peddling = false
//  var brakesApplied = false
//  
//  func accelerate() {
//    peddling = true
//    brakesApplied = false
//  }
//  
//  func stop() {
//    peddling = false
//    brakesApplied = true
//  }
//}

//: ### Associated types in protocols
protocol WeightCalculatable {
  associatedtype WeightType
  func calculateWeight() -> WeightType
}

class HeavyThing: WeightCalculatable {
  // This heavy thing only needs integer accuracy
  typealias WeightType = Int
  
  func calculateWeight() -> Int {
    return 100
  }
}

class LightThing: WeightCalculatable {
  // This light thing needs decimal places
  typealias WeightType = Double
  
  func calculateWeight() -> Double {
    return 0.0025
  }
}

// Build error!
// protocol 'WeightCalculatable' can only be used as a generic
// constraint because it has Self or associated type requirements.
//let weightedThing: WeightCalculatable = LightThing()

//: ### Implementing multiple protocols
protocol Wheeled {
  var numberOfWheels: Int { get }
  var wheelSize: Double { get set }
}

class Bike: Vehicle, Wheeled {
  
  let numberOfWheels = 2
  var wheelSize = 16.0
  
  var peddling = false
  var brakesApplied = false
  
  func accelerate() {
    peddling = true
    brakesApplied = false
  }
  
  func stop() {
    peddling = false
    brakesApplied = true
  }
}

//: ### Extensions and protocol conformance
protocol Reflective {
  var typeName: String { get }
}

extension String: Reflective {
  var typeName: String {
    return "I'm a String"
  }
}

let title = "Swift Apprentice!"
title.typeName // I'm a String

class AnotherBike {
  var peddling = false
  var wheelSize = 16.0
}

extension AnotherBike: Wheeled {
  var numberOfWheels: Int {
    return 2
  }
  // wheelSize already implemented in main body.
}

extension AnotherBike: Vehicle {
  func accelerate() {
    peddling = true
  }
  
  func stop() {
    peddling = false
  }
}

//: ### Requiring reference semantics

protocol Named {
  var name: String { get set }
}

class ClassyName: Named {
  var name: String
  init(name: String) {
    self.name = name
  }
}

struct StructyName: Named {
  var name: String
}

var named: Named = ClassyName(name: "Classy")
var copy = named

named.name = "Still Classy"
named.name // Still Classy
copy.name // Still Classy

named = StructyName(name: "Structy")
copy = named

named.name = "Still Structy?"
named.name // Still Structy?
copy.name // Structy

//protocol Named: class {
//  var name: String { get set }
//}

//: ## Protocols in the standard library

//: Equatable

let a = 5
let b = 5

a == b // true

let swiftA = "Swift"
let swiftB = "Swift"

swiftA == swiftB // true

struct Record {
  var wins: Int
  var losses: Int
}

let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)

//recordA == recordB // Build error!

extension Record: Equatable {
  static func ==(lhs: Record, rhs: Record) -> Bool {
    return lhs.wins == rhs.wins && lhs.losses == rhs.losses
  }
}

recordA == recordB // true

//: Comparable

extension Record: Comparable {
  static func <(lhs: Record, rhs: Record) -> Bool {
    if lhs.wins == rhs.wins {
      return lhs.losses > rhs.losses
    }
    return lhs.wins < rhs.wins
  }
}

//: Free functions
let teamA = Record(wins: 14, losses: 11)
let teamB = Record(wins: 23, losses: 8)
let teamC = Record(wins: 23, losses: 9)
var leagueRecords = [teamA, teamB, teamC]

leagueRecords.sort()
// {wins 14, losses 11}
// {wins 23, losses 9}
// {wins 23, losses 8}

leagueRecords.max() // {wins 23, losses 8}
leagueRecords.min() // {wins 14, losses 11}
leagueRecords.starts(with: [teamA, teamC]) // true
leagueRecords.contains(teamA) // true

//: Hashable

class Student {
  let email: String
  var firstName: String
  var lastName: String
  
  init(email: String, firstName: String, lastName: String) {
    self.email = email
    self.firstName = firstName
    self.lastName = lastName
  }
}

extension Student: Equatable {
  static func ==(lhs: Student, rhs: Student) -> Bool {
    return lhs.email == rhs.email
  }
}

extension Student: Hashable {
  var hashValue: Int {
    return email.hashValue
  }
}

let john = Student(email: "johnny.appleseed@apple.com", firstName: "Johnny", lastName: "Appleseed")
let lockerMap = [john: "14B"]

//: CustomStringConvertible

print(john) // Student

extension Student: CustomStringConvertible {
  var description: String {
    return "\(firstName) \(lastName)"
  }
}

print(john) // Johnny Appleseed
