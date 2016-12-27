// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

/*: 
 ## Properties Challenge Set A
 
 Rewrite the `IceCream` structure below to use default values and lazy initialization:
 
 ```
 struct IceCream {
   let name: String
   let ingredients: [String]
 }
 ```
 
 1. Change the values in the initializer to default values for the properties.
 2. Lazily initialize the `ingredients` array.

 */

struct IceCream {
  var name = "Plain"
  lazy var ingredients: [String] = {
    return ["sugar", "milk", "yolks"]
  }()
}

var iceCream = IceCream()
// ingredients not yet initialized
iceCream.ingredients.append("strawberries")
// ingredients initialized before appending
iceCream.name = "Strawberry"
