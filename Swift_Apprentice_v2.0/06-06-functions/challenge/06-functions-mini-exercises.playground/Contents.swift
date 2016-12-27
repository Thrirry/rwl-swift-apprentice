// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

func printFullName(firstName: String, lastName: String) {
  print(firstName + " " + lastName)
}
printFullName(firstName: "Matt", lastName: "Galloway")

func printFullName(_ firstName: String, _ lastName: String) {
  print(firstName + " " + lastName)
}
printFullName("Matt", "Galloway")

func calculateFullName(_ firstName: String, _ lastName: String) -> String {
  return firstName + " " + lastName
}
let fullName = calculateFullName("Matt", "Galloway")

func calculateFullNameWithLength(_ firstName: String, _ lastName: String) -> (name: String, length: Int) {
  let fullName = firstName + " " + lastName
  return (fullName, fullName.characters.count)
}
let fullNameLength = calculateFullNameWithLength("Matt", "Galloway").length
