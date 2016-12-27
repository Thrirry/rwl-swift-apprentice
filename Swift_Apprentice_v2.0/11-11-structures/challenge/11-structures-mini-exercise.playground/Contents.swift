// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

//: 1. Write a struct that represents a pizza order. Include toppings, size and any other option you’d want for a pizza.

struct Pizza {
  let size: Int // Inches
  let toppings: [String] // Pepperoni, cheese
  let style: String // Thick, thin, hand-tossed
}

let pizza = Pizza(size: 14, toppings: ["Pepperoni", "Mushrooms", "Anchovies"], style: "Thin")

//: 2. Rewrite `isInDeliveryRange` to use `Location` and `DeliveryArea`.

// In case you haven't noticed, a solution can be found right after the exercise, in the "Introducing methods" section :]

//: 3. Add a method `overlaps(with:)` on `DeliveryArea` that can tell you if the area overlaps with another area.

struct Location {
  let x: Int
  let y: Int
}

func distance(from source: Location, to target: Location) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return sqrt(distanceX * distanceX + distanceY * distanceY)
}

struct DeliveryArea {
  var range: Double
  let center: Location
  
  func contains(_ location: Location) -> Bool {
    let distanceFromCenter = distance(from: center, to: location)
    return distanceFromCenter < range
  }
  
  func overlaps(with area: DeliveryArea) -> Bool {
    return distance(from: center, to: area.center) >= (range + area.range)
  }
}

let area1 = DeliveryArea(range: 2.5, center: Location(x: 2, y: 4))
let area2 = DeliveryArea(range: 2.5, center: Location(x: 2, y: 9))

area1.overlaps(with: area2)
