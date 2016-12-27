// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

// OPTIONALS INTRODUCTION
let myFavoriteSong: String? = "The Final Countdown" // or nil

let parsedInt = Int("10") // returns an optional because the string may not be an integer, in which case the result will be nil
let anotherParsedInt = Int("dog") // nil


// UNWRAPPING
if let song = myFavoriteSong {
  print(song)
} else {
  print("I don’t have a favorite song.")
}
