// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

/*:
 ## Enumerations Challenge Set C
 
 Taking the map example from earlier in the chapter, begin with the `Direction` enumeration:
 
 ```swift
 enum Direction {
 case north
 case south
 case east
 case west
 }
 ```
 
 Imagine starting a new level in a video game. The character makes a series of movements in the game. Calculate the position of the character on a top-down level map:
 
 ```swift
 let movements: [Direction] = [.north, .north, .west, .south,
 .west, .south, .south, .east, .east, .south, .east]
 ```
 
 **Hint:** Use a tuple for the location:
 
 
 ```swift
 var location = (x: 0, y: 0)
 ```
 
 */

enum Direction {
  case north
  case south
  case east
  case west
}

let movements: [Direction] = [.north, .north, .west, .south, .west, .south, .south, .east, .east, .south, .east]

var location = (x: 0, y: 0)

for movement in movements {
  switch movement {
  case .north:
    location.y += 1
  case .south:
    location.y -= 1
  case .east:
    location.x += 1
  case .west:
    location.x -= 1
  }
}

let currentX = location.x // 1
let currentY = location.y // -2
