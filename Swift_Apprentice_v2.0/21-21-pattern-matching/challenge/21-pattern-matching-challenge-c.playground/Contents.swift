// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

/*:
 ## Pattern Matching
 ### Challenge C
 
 Given this code, find the albums that were released in 1974 with a `for` loop:
 
 ```swift
 let queenAlbums = [ 
   ("A Night at the Opera", 1974),
   ("Sheer Heart Attack", 1974),
   ("Jazz", 1978),
   ("The Game", 1980)
 ]
 ```
 */

let queenAlbums = [
  ("A Night at the Opera", 1974),
  ("Sheer Heart Attack", 1974),
  ("Jazz", 1978),
  ("The Game", 1980)
]

for case (let album, 1974) in queenAlbums {
  print("Queen's album \(album) was released in 1974") // 2 times
}
