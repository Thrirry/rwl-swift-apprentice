// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

// Do you have a television or a computer monitor? Measure the height and width, plug it into a `TV` struct, and see if the diagonal measurement matches what you think it is.

// Picture of real TV: http://www.screenmath.com/images/compare02.gif

struct TV {
  var height: Double
  var width: Double
  
  var diagonal: Int {
    let result = sqrt(height * height + width * width)
    let roundedResult = result.rounded(.toNearestOrAwayFromZero)
    return Int(roundedResult)
  }
}

let tv = TV(height: 15.7, width: 28)
let size = tv.diagonal // 32
