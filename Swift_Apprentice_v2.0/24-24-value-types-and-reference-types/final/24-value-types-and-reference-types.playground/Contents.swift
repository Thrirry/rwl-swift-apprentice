// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import UIKit

struct Color: CustomStringConvertible {
  var red, green, blue: Double
  
  var description: String {
    return "r: \(red) g: \(green) b: \(blue)"
  }
}

// Preset colors
extension Color {
  static var black = Color(red: 0, green: 0, blue: 0)
  static var white = Color(red: 1, green: 1, blue: 1)
  static var blue  = Color(red: 0, green: 0, blue: 1)
  static var green = Color(red: 0, green: 1, blue: 0)
  // more ...
}

// Paint bucket abstraction
class Bucket {
  init(color: Color) {
    self.color = color
  }
  
  var color: Color
  var isRefilled = false
  func refill() {
    isRefilled = true
  }
}

let azurePaint = Bucket(color: .blue)
let wallBluePaint = azurePaint
wallBluePaint.isRefilled // => false, initially
azurePaint.refill()
wallBluePaint.isRefilled // => true, unsurprisingly!

extension Color {
  mutating func darken() {
    red *= 0.9; green *= 0.9; blue *= 0.9
  }
}

var azure = Color.blue
var wallBlue = azure
azure  // r: 0.0 g: 0.0 b: 1.0
wallBlue.darken()
azure  // r: 0.0 g: 0.0 b: 1.0 (unaffected)


class ReferenceType { var value = 0 }
struct ValueType { var value = 0 }

typealias MysteryType = ReferenceType
// or
// typealias MysteryType = ValueType

func exposeValue(_ mystery: MysteryType) -> Int {
  return mystery.value
}

var x = MysteryType()
var y = x
exposeValue(x) // => initial value derived from x
// {code here which uses only y}
y.value = 10
exposeValue(x) // => final value derived from x
// Q: are the initial and final values different?


do {
  // No copy-on-write
  
  struct PaintingPlan // a value type, containing ...
  {
    // a value type
    var accent = Color.white
    // a mutable reference type
    var bucket = Bucket(color: .blue)
  }
  
  var artPlan = PaintingPlan()
  var housePlan = artPlan
  artPlan.bucket.color // => blue
  // for house-painting only we fill the bucket with green paint
  housePlan.bucket.color = Color.green
  artPlan.bucket.color // => green. oops!
  
} // end of scope, so we can try again

do {
  
  // Copy-on-write
  
  struct PaintingPlan // a value type, containing ...
  {
    // a value type
    var accent = Color.white
    // a private reference type, for "deep storage"
    private var bucket = Bucket(color: .blue)
    
    // a pseudo-value type, using the deep storage
    var bucketColor: Color {
      get {
        return bucket.color
      }
      set {
        bucket = Bucket(color: newValue)
      }
    }
  }
  
  var artPlan = PaintingPlan()
  var housePlan = artPlan
  housePlan.bucketColor = Color.green
  artPlan.bucketColor // blue. better!
  
} // end of do scope, so you can try again!


// Copy-on-write, but only copy when you absolutely have to

struct PaintingPlan // a value type, containing ...
{
  // a value type
  var accent = Color.white
  // a private reference type, for "deep storage"
  private var bucket = Bucket(color: .blue)
  
  // a computed property facade over deep storage
  // with copy-on-write and in-place mutation when possible
  var bucketColor: Color {
    get {
      return bucket.color
    }
    set {
      if isKnownUniquelyReferenced(&bucket) {
        bucket.color = bucketColor
      } else {
        bucket = Bucket(color: newValue)
      }
    }
  }
}

var artPlan = PaintingPlan()
var housePlan = artPlan
housePlan.bucketColor = Color.green
artPlan.bucketColor // blue. good!


