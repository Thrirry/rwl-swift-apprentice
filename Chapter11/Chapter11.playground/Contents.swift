//: Playground - noun: a place where people can play

import UIKit
import Foundation


let restaurantLcation = (2, 4)
let restaurantRange = 2.5

//Pythagorean Theorem🍕🎓
func distance(from source: (x: Int, y: Int), to target: (x: Int, y: Int)) -> Double{
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return sqrt(distanceX * distanceX + distanceY * distanceY)
}

func inDeliveryRange(location : (x: Int, y: Int)) -> Bool{
    let deliveryDistance = distance(from: location, to: restaurantLcation)
    return deliveryDistance < restaurantRange
}

struct pizzaOrder {
    var price : Double
    var taste : String
    var size : String
    var border: Bool
    var extra: String
}


