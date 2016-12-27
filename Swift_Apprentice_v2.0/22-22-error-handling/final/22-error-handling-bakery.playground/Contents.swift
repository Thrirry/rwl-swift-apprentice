// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

class Pastry {
  let flavor: String
  var numberOnHand: Int
  
  init(flavor: String, numberOnHand: Int) {
    self.flavor = flavor
    self.numberOnHand = numberOnHand
  }
}

enum BakeryError: Error {
  case tooFew(numberOnHand: Int)
  case doNotSell
  case wrongFlavor
}

class Bakery {
  var itemsForSale = [
    "Cookie": Pastry(flavor: "ChocolateChip", numberOnHand: 20),
    "PopTart": Pastry(flavor: "WildBerry", numberOnHand: 13),
    "Donut" : Pastry(flavor: "Sprinkles", numberOnHand: 24),
    "HandPie": Pastry(flavor: "Cherry", numberOnHand: 6)
  ]
  
  func orderPastry(item: String, amountRequested: Int, flavor: String) throws -> Int {
    guard let pastry = itemsForSale[item] else {
      throw BakeryError.doNotSell
    }
    guard flavor == pastry.flavor else {
      throw BakeryError.wrongFlavor
    }
    guard amountRequested < pastry.numberOnHand else {
      throw BakeryError.tooFew(numberOnHand: pastry.numberOnHand)
    }
    pastry.numberOnHand -= amountRequested
    
    return pastry.numberOnHand
  }
}



let bakery = Bakery()

do {
  try bakery.orderPastry(item: "Albatross", amountRequested: 1, flavor: "AlbatrossFlavor")
} catch BakeryError.doNotSell {
  print("Sorry, but we don't sell albatross")
} catch BakeryError.wrongFlavor {
  print("Sorry, but we don't carry albatross flavor")
} catch BakeryError.tooFew {
  print("Sorry, we don't have enough albatross to fulfill your order")
}

let remaining = try? bakery.orderPastry(item: "Albatross",
                                        amountRequested: 1,
                                        flavor: "AlbatrossFlavor")

do {
  try bakery.orderPastry(item: "Cookie", amountRequested: 1, flavor: "ChocolateChip")
}
catch {
  fatalError()
}

try! bakery.orderPastry(item: "Cookie", amountRequested: 1, flavor: "ChocolateChip")

