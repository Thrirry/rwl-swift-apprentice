// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

let coordinate = (x: 1, y: 0, z: 0)

if (coordinate.y == 0) && (coordinate.z == 0) {
  print("along the x-axis")
}

if case (_, 0, 0) = coordinate {
  print("along the x-axis")
}

//func process(point: (x: Int, y: Int, z: Int)) -> String {
//  if case (0, 0, 0) = point {
//    return "At origin"
//  }
//  return "Not at origin"
//}
//
//let point = (x: 0, y: 0, z: 0)
//let response = process(point: point) // At origin

//func process(point: (x: Int, y: Int, z: Int)) -> String {
//  guard case (0, 0, 0) = point else {
//    return "Not at origin"
//  }
//  // guaranteed point is at the origin
//  return "At origin"
//}
//
//let point = (x: 0, y: 0, z: 0)
//let response = process(point: point) // At origin

func process(point: (x: Int, y: Int, z: Int)) -> String {
  let closeRange = -2...2
  let midRange = -5...5

  switch point {
  case (0, 0, 0):
    return "At origin"
  case (closeRange, closeRange, closeRange):
    return "Very close to origin"
  case (midRange, midRange, midRange):
    return "Nearby origin"
  default:
    return "Not near origin"
  }
}

let point = (x: 15, y: 5, z: 3)
let response = process(point: point) // Not near origin

let groupSizes = [1, 5, 4, 6, 2, 1, 3]
for case 1 in groupSizes {
  print("Found an individual") // 2 times
}

if case (_, 0, 0) = coordinate {
  // x can be any value. y and z must be exactly 0.
  print("On the x-axis") // Printed!
}

if case (let x, 0, 0) = coordinate {
  print("On the x-axis at \(x)") // Printed: 1
}

if case let (x, y, 0) = coordinate {
  print("On the x-y plane at (\(x), \(y))") // Printed: 1, 0
}

enum Direction {
  case north, south, east, west
}

let heading = Direction.north

if case .north = heading {
  print("Don't forget your jacket") // Printed!
}

enum Organism {
  case plant
  case animal(legs: Int)
}

let pet = Organism.animal(legs: 4)

switch pet {
case .animal(let legs):
  print("Potentially cuddly with \(legs) legs") // Printed: 4
default:
  print("No chance for cuddles")
}

let names: [String?] = ["Michelle", nil, "Brandon", "Christine", nil, "David"]

for case let name? in names {
  print(name) // 4 times
}

let array: [Any] = [15, "George", 2.0]

for element in array {
  switch element {
  case is String:
    print("Found a string") // 1 time
  default:
    print("Found something else") // 2 times
  }
}

for element in array {
  switch element {
  case let text as String:
    print("Found a string: \(text)") // 1 time
  default:
    print("Found something else") // 2 times
  }
}

for number in 1...9 {
  switch number {
  case let x where x % 2 == 0:
    print("even") // 4 times
  default:
    print("odd") // 5 times
  }
}

enum LevelStatus {
  case complete
  case inProgress(percent: Double)
  case notStarted
}

let levels: [LevelStatus] = [.complete, .inProgress(percent: 0.9), .notStarted]

for level in levels {
  switch level {
  case .inProgress(let percent) where percent > 0.8 :
    print("Almost there!")
  case .inProgress(let percent) where percent > 0.5 :
    print("Halfway there!")
  case .inProgress(let percent) where percent > 0.2 :
    print("Made it through the beginning!")
  default:
    break
  }
}

func timeOfDayDescription(hour: Int) -> String {
  switch hour {
  case 0, 1, 2, 3, 4, 5:
    return "Early morning"
  case 6, 7, 8, 9, 10, 11:
    return "Morning"
  case 12, 13, 14, 15, 16:
    return "Afternoon"
  case 17, 18, 19:
    return "Evening"
  case 20, 21, 22, 23:
    return "Late evening"
  default:
    return "INVALID HOUR!"
  }
}
let timeOfDay = timeOfDayDescription(hour: 12) // Afternoon

if case .animal(let legs) = pet, case 2...4 = legs {
  print("potentially cuddly") // Printed!
} else {
  print("no chance for cuddles")
}

enum Number {
  case integerValue(Int)
  case doubleValue(Double)
  case booleanValue(Bool)
}

let a = 5
let b = 6
let c: Number? = .integerValue(7)
let d: Number? = .integerValue(8)

if a != b {
  if let c = c {
    if let d = d {
      if case .integerValue(let cValue) = c {
        if case .integerValue(let dValue) = d {
          if dValue > cValue {
            print("a and b are different") // Printed!
            print("d is greater than c") // Printed!
            print("sum: \(a + b + cValue + dValue)") // Printed: 26
          }
        }
      }
    }
  }
}

if a != b,
   let c = c,
   let d = d,
   case .integerValue(let cValue) = c,
   case .integerValue(let dValue) = d,
   dValue > cValue {
  print("a and b are different") // Printed!
  print("d is greater than c") // Printed!
  print("sum: \(a + b + cValue + dValue)") // Printed: 26
}

let name = "Bob"
let age = 23

if case ("Bob", 23) = (name, age) {
  print("Found the right Bob!") // Printed!
}

var username: String?
var password: String?

switch (username, password) {
case let (username?, password?):
  print("Success!")
case let (username?, nil):
  print("Password is missing")
case let (nil, password?):
  print("Username is missing")
case (nil, nil):
  print("Both username and password are missing")  // Printed!
}

for _ in 1...3 {
  print("hi") // 3 times
}


let user: String? = "Bob"
guard let _ = user else {
  print("There is no user.")
  fatalError()
}
print("User exists, but identity not needed.") // Printed!

guard user != nil else {
  print("There is no user.")
  fatalError()
}
print("User exists, but identity not needed.") // Printed!

struct Rectangle {
  let width: Int
  let height: Int
  let color: String
}

let view = Rectangle(width: 15, height: 60, color: "Green")
switch view {
case _ where view.height < 50:
  print("View shorter than 50 units")
case _ where view.width > 20:
  print("View at least 50 tall, & more than 20 wide")
case _ where view.color == "Green":
  print("View at least 50 tall, at most 20 wide, & green") // Printed!
default:
  print("This view can't be described by this example")
}
