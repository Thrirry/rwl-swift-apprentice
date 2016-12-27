// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

enum Direction {
  case left
  case right
  case forward
}

enum PugBotError: Error {
  case invalidMove(found: Direction, expected: Direction)
  case endOfPath
}

class PugBot {
  let name: String
  let correctPath: [Direction]
  private var currentStepInPath = 0

  init(name: String, correctPath: [Direction]) {
    self.correctPath = correctPath
    self.name = name
  }

  func turnLeft() throws {
    guard currentStepInPath < correctPath.count else {
      throw PugBotError.endOfPath
    }
    let nextDirection = correctPath[currentStepInPath]
    guard nextDirection == .left else {
      throw PugBotError.invalidMove(found: .left, expected: nextDirection)
    }
    currentStepInPath += 1
  }

  func turnRight() throws {
    guard currentStepInPath < correctPath.count else {
      throw PugBotError.endOfPath
    }
    let nextDirection = correctPath[currentStepInPath]
    guard nextDirection == .right else {
      throw PugBotError.invalidMove(found: .right, expected: nextDirection)
    }
    currentStepInPath += 1
  }

  func moveForward() throws {
    guard currentStepInPath < correctPath.count else {
      throw PugBotError.endOfPath
    }
    let nextDirection = correctPath[currentStepInPath]
    guard nextDirection == .forward else {
      throw PugBotError.invalidMove(found: .forward, expected: nextDirection)
    }
    currentStepInPath += 1
  }
}

let pug = PugBot(name: "Pug", correctPath: [.forward, .left, .forward, .right])

func goHome() throws {
  try pug.moveForward()
  try pug.turnLeft()
  try pug.moveForward()
  try pug.turnRight()
}


func moveSafely(move:() throws -> ()) -> String {
  do {
    try move()
    return "Completed operation successfully."
  } catch PugBotError.invalidMove(let found, let expected) {
    return "The PugBot was supposed to move \(expected), but moved \(found) instead."
  } catch PugBotError.endOfPath() {
    return "The PugBot tried to move past the end of the path."
  } catch {
    return "An unknown error occurred"
  }
}

moveSafely {
  try pug.moveForward()
  try pug.turnLeft()
  try pug.moveForward()
  try pug.turnRight()
}


func perform(times: Int, movement: () throws -> ()) rethrows {
  for _ in 1...times {
    try movement()
  }
}
