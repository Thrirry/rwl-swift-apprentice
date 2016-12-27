// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)
/*:
 ## Enumerations Challenge Set B
 
 Taking the example from earlier in the chapter, begin with the `Month` enumeration:
 
 ```swift
 enum Month: Int {
 case january = 1, february, march, april, may, june, july,
 august, september, october, november, december
 }
 ```
 
 Write a computed property to calculate the number of months until summer.
 
 **Hint:** You’ll need to account for a negative value if summer has already passed in the current year. To do that, imagine looping back around for the next full year.
 */

enum Month: Int {
  case january = 1, february, march, april, may, june, july, august, september, october, november, december
  
  var monthsUntilSummer: Int {
    var monthsLeft = Month.june.rawValue - self.rawValue
    if monthsLeft < 0 {
      monthsLeft += 12
    }
    return monthsLeft
  }
}

let month = Month.november
let monthsLeft = month.monthsUntilSummer // 7
