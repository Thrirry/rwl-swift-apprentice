// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

let names = ["Matt", "Ray", "Vicki", "Alice", "Barnaby"]

let allNames = names.reduce("") {
  $0 + $1
}

let filteredNames = names.filter {
  $0.characters.count > 4
}.reduce("") {
  $0 + $1
}

let namesAndAges = ["Matt": 30, "Alice": 25, "Barnaby": 12, "Ingrid": 41]

let children = namesAndAges.filter {
  $0.value < 18
}

let adults = namesAndAges.filter {
  $0.value >= 18
}.map {
  $0.key
}
