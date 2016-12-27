// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// Given the population of a group of people, write a `switch` statement that prints out a comment for different ranges of group sizes: single, a few, several, and many.

let population = 3

switch population {
case 1:
  print("single")
case 2...3:
  print("a few")  // Printed!
case 4..<6:
  print("several")
default:
  print("many")
}
