// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// -------------------
// | Mini Challanges |
// -------------------

// Write a function that prints a given player's city and state

var bob = ["name": "Bob",
           "profession": "Card Player",
           "country": "USA",
           "state": "CA",
           "city": "San Francisco"]

func printLocation(ofPlayer player: [String: String]) {
  if let state = player["state"], let city = player["city"] {
    print("Player lives in \(city), \(state)")
  }
}

printLocation(ofPlayer: bob)
