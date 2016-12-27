// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// Make `monthsUntilWinterBreak` a computed property of the `Month` enumeration

enum Month: Int {
  case january = 1, february, march, april, may, june, july, august, september, october, november, december
  
  var monthsUntilWinterBreak: Int {
    return Month.december.rawValue - rawValue
  }
}

let fifthMonth = Month(rawValue: 5)!
let monthsLeft = fifthMonth.monthsUntilWinterBreak  // 7
