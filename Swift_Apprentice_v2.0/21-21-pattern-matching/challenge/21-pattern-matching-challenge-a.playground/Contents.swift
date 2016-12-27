// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

/*:
 ## Pattern Matching
 ### Challenge A
 
 Given this code, write an `if` statement that shows an error if the user is not yet 21 years old:
 
 ```swift
 enum FormField {
   case firstName(String)
   case lastName(String)
   case emailAddress(String)
   case age(Int)
 }
 let minimumAge = 21
 let submittedAge = FormField.age(22)
 ```
 */

enum FormField {
  case firstName(String)
  case lastName(String)
  case emailAddress(String)
  case age(Int)
}
let minimumAge = 21
let submittedAge = FormField.age(22)

if case .age(let years) = submittedAge, years > minimumAge {
  print("Welcome!")
} else {
  print("Sorry, you're too young!")
}
