// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

/*:
 ## Pattern Matching
 ### Challenge B
 
 Given this code, find the planets with liquid water using a `for` loop:
 
 ```swift
 enum CelestialBody {
   case star
   case planet(liquidWater: Bool)
   case comet
 }
 
 let telescopeCensus = [
   CelestialBody.star,
   CelestialBody.planet(liquidWater: false),
   CelestialBody.planet(liquidWater: true),
   CelestialBody.planet(liquidWater: true),
   CelestialBody.comet
 ]
 ```
 
 
 */

enum CelestialBody {
  case star
  case planet(liquidWater: Bool)
  case comet
}

let telescopeCensus = [
  CelestialBody.star,
  CelestialBody.planet(liquidWater: false),
  CelestialBody.planet(liquidWater: true),
  CelestialBody.planet(liquidWater: true),
  CelestialBody.comet
]

for case .planet(let water) in telescopeCensus where water {
  print("Found a potentially habitable planet!") // 2 times
}
