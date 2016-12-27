// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// -------------------
// | CREATING ARRAYS |
// -------------------

let evenNumbers = [2, 4, 6, 8]

var subscribers: [String] = []

let allZeros = [Int](repeating: 0, count: 5)
// > [0, 0, 0, 0, 0]

let allZerosInferred = Array(repeating: 0, count: 5)
// > [0, 0, 0, 0, 0]

let vowels = ["A", "E", "I", "O", "U"]

// ----------------------
// | ACCESSING ELEMENTS |
// ----------------------

var players = ["Alice", "Bob", "Cindy", "Dan"]

print(players.isEmpty)
// > false

if players.count < 2 {
  print("We need at least two players!")
} else {
  print("Let's start!")
}
// > Let's start!

var currentPlayer = players.first

print(currentPlayer)
// > Optional("Alice")

print(players.last)
// > Optional("Dan")

currentPlayer = players.min()
print(currentPlayer)
// > Optional("Alice")

print([2, 3, 1].first)
// > Optional(2)
print([2, 3, 1].min())
// > Optional(1)

if let currentPlayer = currentPlayer {
  print("\(currentPlayer) will start")
}
// > Alice will start

var firstPlayer = players[0]
print("First player is \(firstPlayer)")
// > First player is "Alice"

//var player = players[4]
// > fatal error: Index out of range

let upcomingPlayers = players[1...2]
print(upcomingPlayers)
// > ["Bob", "Cindy"]

func isEliminated(player: String) -> Bool {
  return !players.contains(player)
}

print(isEliminated(player: "Bob"))
// > false

players[1...3].contains("Bob")
// > true

// -------------------------
// | MANIPULATING ELEMENTS |
// -------------------------

players.append("Eli")

players += ["Gina"]

print(players)
// > ["Alice", "Bob", "Cindy", "Dan", "Eli", "Gina"]

players.insert("Frank", at: 5)

// ---------------------
// | REMOVING ELEMENTS |
// ---------------------

var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed")
// > Gina was removed

removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed")
// > Cindy was removed

// ---------------------
// | UPDATING ELEMENTS |
// ---------------------

print(players)
// > ["Alice", "Bob", "Dan", "Eli", "Frank"]
players[4] = "Franklin"
print(players)
// > ["Alice", "Bob", "Dan", "Eli", "Franklin"]

players[0...1] = ["Donna", "Craig", "Brian", "Anna"]
print(players)
// > ["Donna", "Craig", "Brian", "Anna", "Dan", "Eli", "Franklin"]

let playerAnna = players.remove(at: 3)
players.insert(playerAnna, at: 0)
print(players)
// > ["Anna", "Donna", "Craig", "Brian", "Dan", "Eli", "Franklin"]

players.sort()
print(players)
// > ["Anna", "Brian", "Craig", "Dan", "Donna", "Eli", "Franklin"]


// -------------
// | ITERATION |
// -------------

let scores = [2, 2, 8, 6, 1, 2, 1]

for player in players {
  print(player)
}
// > Anna
// > Brian
// > Craig
// > Dan
// > Donna
// > Eli
// > Franklin

for (index, player) in players.enumerated() {
  print("\(index + 1). \(player)")
}
// > 1. Anna
// > 2. Brian
// > 3. Craig
// > 4. Dan
// > 5. Donna
// > 6. Eli
// > 7. Franklin

func sumOfAllItems(in array: [Int]) -> Int {
  var sum = 0
  for number in array {
    sum += number
  }
  return sum
}

print(sumOfAllItems(in: scores))
// > 22


// -----------------------
// | VARIADIC PARAMETERS |
// -----------------------

func sum(of numbers: Int...) -> Int {
  var total = 0
  for number in numbers {
    total += number
  }
  return total
}

sum(of: 1, 6, 2, -3)
// > 6
