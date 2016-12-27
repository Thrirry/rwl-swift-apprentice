// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

struct Car {
  let make: String
  let color: String
}

struct Contact {
  var fullName: String
  let emailAddress: String
  //var type = "Friend"
}

var person = Contact(fullName: "Grace Murray", emailAddress: "grace@navy.mil")

let name = person.fullName // Grace Murray
let email = person.emailAddress // grace@navy.mil

person.fullName = "Grace Hopper"
let grace = person.fullName // Grace Hopper

// Error: cannot assign to a constant
//person.emailAddress = "grace@gmail.com"

struct TV {
  var height: Double
  var width: Double
  
  var diagonal: Int {
    get {
      let result = sqrt(height * height + width * width)
      let roundedResult = result.rounded()
      return Int(roundedResult)
    }
    set {
      let ratioWidth = 16.0
      let ratioHeight = 9.0
      height = Double(newValue) * ratioHeight / sqrt(ratioWidth * ratioWidth + ratioHeight * ratioHeight)
      width = height * ratioWidth / ratioHeight
    }
  }
}

var tv = TV(height: 53.93, width: 95.87)
let size = tv.diagonal // 110

tv.width = tv.height
let diagonal = tv.diagonal // 76

tv.diagonal = 70
let height = tv.height // 34.32...
let width = tv.width // 61.01...

struct Level {
  static var highestLevel = 1
  let id: Int
  var boss: String
  var unlocked: Bool {
    didSet {
      if unlocked && id > Level.highestLevel {
        Level.highestLevel = id
      }
    }
  }
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)

// Error: you can't access a type property on an instance
//let highestLevel = level3.highestLevel

let highestLevel = Level.highestLevel // 1

struct LightBulb {
  static let maxCurrent = 40
  var current = 0 {
    didSet {
      if current > LightBulb.maxCurrent {
        print("Current too high, falling back to previous setting.")
        current = oldValue
      }
    }
  }
}

var light = LightBulb()
light.current = 50
var current = light.current // 0
light.current = 40
current = light.current // 40

struct Circle {
  lazy var pi = {
    return ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
  }()
  var radius = 0.0
  var circumference: Double {
    mutating get {
      return pi * radius * 2
    }
  }
  init (radius: Double) {
    self.radius = radius
  }
}

var circle = Circle(radius: 5) // got a circle, pi has not been run
let circumference = circle.circumference // 31.42
// also, pi now has a value
