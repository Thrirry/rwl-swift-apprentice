// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

// Given the `Circle` example, remove the lazy stored property, `pi`. Use the value of pi from the Swift standard library instead.

struct Circle {
  var radius = 0.0
  var circumference: Double {
    return Double.pi * radius * 2
  }
  
  init (radius: Double) {
    self.radius = radius
  }
}

var circle = Circle(radius: 5)
let circumference = circle.circumference // 31.42
