// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

// -- Introducing structures --

let restaurantLocation = (2, 4)
let restaurantRange = 2.5

let otherRestaurantLocation = (7, 8)
let otherRestaurantRange = 1.5

// Pythagorean Theorem 📐🎓
func distance(from source: (x: Int, y: Int), to target: (x: Int, y: Int)) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return sqrt(distanceX * distanceX + distanceY * distanceY)
}

//func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
//  let deliveryDistance = distance(from: location, to: restaurantLocation)
//  return deliveryDistance < restaurantRange
//}

func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
  let deliveryDistance = distance(from: location, to: restaurantLocation)
  let secondDeliveryDistance = distance(from: location, to: otherRestaurantLocation)
  return deliveryDistance < restaurantRange || secondDeliveryDistance < otherRestaurantRange
}

struct Location {
  let x: Int
  let y: Int
}

let storeLocation = Location(x: 2, y: 4)

struct DeliveryArea /* Added in section "Conforming to a protocol" */: CustomStringConvertible {
  var range: Double
  let center: Location
  
  // Added in section "Introducing methods"
  func contains(_ location: Location) -> Bool {
    let distanceFromCenter = distance(from: (center.x, center.y), to: (location.x, location.y))
    return distanceFromCenter < range
  }
  
  // Added in section "Conforming to a protocol"
  var description: String {
    return "Area with range: \(range), location: x: \(center.x) - y: \(center.y)"
  }
}

var storeArea = DeliveryArea(range: 4, center: storeLocation)

// -- Accessing members --

print(storeArea.range) // 4.0
print(storeArea.center.x) // 2.0
storeArea.range = 250

let fixedArea = DeliveryArea(range: 4, center: storeLocation)
// Error: change let to var above to make it mutable.
//fixedArea.range = 250

// -- Introducing methods --

let areas = [
  DeliveryArea(range: 2.5, center: Location(x: 2, y: 4)),
  DeliveryArea(range: 4.5, center: Location(x: 9, y: 7))
]

func isInDeliveryRange(_ location: Location) -> Bool {
  for area in areas {
    let distanceToStore = distance(from: (area.center.x, area.center.y), to: (location.x, location.y))
    if distanceToStore < area.range {
      return true
    }
  }
  return false
}

let customerLocation1 = Location(x: 8, y: 1)
let customerLocation2 = Location(x: 5, y: 5)

print(isInDeliveryRange(customerLocation1)) // false
print(isInDeliveryRange(customerLocation2)) // true

let area = DeliveryArea(range: 4.5, center: Location(x: 5, y: 5))
let customerLocation = Location(x: 2, y: 2)
area.contains(customerLocation) // true

// -- Structures as values --

var a = 5
var b = a
print(a) // 5
print(b) // 5

a = 10
print(a) // 10
print(b) // 5

var area1 = DeliveryArea(range: 2.5, center: Location(x: 2, y: 4))
var area2 = area1
print(area1.range) // 2.5
print(area2.range) // 2.5

area1.range = 4
print(area1.range) // 4.0
print(area2.range) // 2.5

// -- Conforming to a protocol --

print(area1) // "Area with range: 4.0, location: x:2.0 - y:4.0"
print(area2) // "Area with range: 2.5, location: x:2.0 - y:4.0"
