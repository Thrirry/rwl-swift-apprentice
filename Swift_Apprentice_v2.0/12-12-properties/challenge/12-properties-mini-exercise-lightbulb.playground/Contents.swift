// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

// In the lightbulb example, the bulb goes back to a successful setting if the current gets too high. In real life, that wouldn't work. The bulb would burn out! Rewrite the structure so that the bulb turns off before the current burns it out. You'll need to use the `willSet` observer for this. This observer gets called *before* the value is changed. The value that is about to be set is available in the constant `newValue`. Keep in mind that you cannot change this `newValue`, and it will still be set, so you'll have to do more than just add a `willSet` observer. :]

struct LightBulb {
  static let maxCurrent = 40
  var isOn = false
  var current = LightBulb.maxCurrent {
    willSet { // can observe the newValue, but can't change it
      if newValue > LightBulb.maxCurrent {
        print("Current too high, turning off to prevent burn out.")
        isOn = false
      }
    }
    didSet {
      if current > LightBulb.maxCurrent {
        print("Current too high, falling back to previous setting.")
        current = oldValue
      }
    }
  }
}

// Installing a new bulb
var bulb = LightBulb() // Light bulb is off

// Flipping the switch
bulb.isOn = true // Light bulb is ON with 40 amps

// Using the dimmer
bulb.current = 30 // Light bulb is ON with 30 amps

// Using the dimmer to a high value
bulb.current = 50 // Light bulb is OFF

// Flipping the switch
bulb.isOn = true // Light bulb is ON with 30 amps
