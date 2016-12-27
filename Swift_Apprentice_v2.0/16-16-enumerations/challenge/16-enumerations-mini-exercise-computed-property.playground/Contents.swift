// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// Wouldn't it be nice to request the semester from an instance like, `month.semester` instead of using the function? Add a `semester` computed property to the `Month` enumeration.

enum Month {
  case january, february, march, april, may, june, july, august, september, october, november, december
  
  var semester: String {
    switch self {
    case .august, .september, .october, .november, .december:
      return "Autumn"
    case .january, .february, .march, .april, .may:
      return "Spring"
    case .june, .july:
      return "Summer"
    }
  }
}

var month = Month.september
let semester = month.semester // "Autumn"
