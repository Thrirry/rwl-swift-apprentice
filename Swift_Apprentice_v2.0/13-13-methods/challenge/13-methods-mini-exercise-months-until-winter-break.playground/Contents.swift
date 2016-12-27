// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

// Since `monthsUntilWinterBreak()` returns a single value and there's not much calculation involved, transform the method into a computed property with a getter component.

let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

struct SimpleDate {
  var month: String
  
  var monthsUntilWinterBreak: Int {
    return months.index(of: "December")! - months.index(of: month)!
  }
}

let date = SimpleDate(month: "October")
let monthsLeft = date.monthsUntilWinterBreak // 2
