// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// In Chapter 16, "Enumerations" you learned that an optional is an enumeration under the hood. An optional is either `.some(value)` or `.none`. You just learned how to extract associated values from optionals. Given the following array of optionals, print the names that are not `nil` with a `for` loop:

let names: [String?] = ["Michelle", nil, "Brandon", "Christine", nil, "David"]

for case .some(let name) in names {
  print(name) // 4 times
}
