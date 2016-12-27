// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)


/*:
 ## Pattern Matching
 ### Challenge D
 Given this code, write a `switch` statement that will print out whether the monument is located in the northern hemisphere, the southern hemisphere, or on the equator.
 
 ```swift
 let coordinates = (lat: 192.89483, long: -68.887463)
 ```
 */
 
let coordinates = (lat: 192.89483, long: -68.887463)

switch coordinates {
case (let lat, _) where lat < 0:
  print("In the Northern hemisphere!")
case (let lat, _) where lat == 0:
  print("Its on the equator!")
case (let lat, _) where lat > 0:
  print("In the Southern hemisphere!") // Printed!
default:
  break
}
