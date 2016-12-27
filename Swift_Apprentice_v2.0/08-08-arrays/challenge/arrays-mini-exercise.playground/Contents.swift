// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// -------------------
// | Mini Challanges |
// -------------------

// Use index(of:) to determine the position of the element "Dan" in players.

var players = ["Alice", "Bob", "Dan", "Eli", "Frank"]

print(players.index(of: "Dan"))


// Write a for-in loop that prints the players' names and scores.

players = ["Anna", "Brian", "Craig", "Dan", "Donna", "Eli", "Franklin"]
let scores = [2, 2, 8, 6, 1, 2, 1]

for (index, player) in players.enumerated() {
  print("\(index + 1). \(player) - \(scores[index])")
}
