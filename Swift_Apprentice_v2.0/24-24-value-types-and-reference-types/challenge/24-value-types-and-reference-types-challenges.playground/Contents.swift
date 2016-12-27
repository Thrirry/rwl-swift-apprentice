// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

/*:
 ## Value Types and Reference Types Challenges
 ### Question 1
 
 Build a new type, `Image`, that represents a simple image. It should also provide mutating functions that apply modifications to the image. Use copy-on-write to economize use of memory in the case where a user defines a large array of these identical images, and does not mutate any of them.
 
 To get you started, assume you are using the following Pixels class for the raw storage.
 
 ```swift
 private class Pixels {
   let size: Int
   let storage: UnsafeMutablePointer<UInt8>
 
   init(size: Int, value: UInt8) {
     self.size = size
     storage = UnsafeMutablePointer<UInt8>.allocate(capacity: size)
     storage.initialize(from: repeatElement(value, count: size))
   }
 
   init(pixels: Pixels) {
     self.size = pixels.size
     storage = UnsafeMutablePointer<UInt8>.allocate(capacity: size)
     storage.initialize(from: pixels.storage, count: pixels.size)
   }
 
   subscript(offset: Int) -> UInt8 {
     get {
       return storage[offset]
     }
     set {
       storage[offset] = newValue
     }
   }
 
   deinit {
     storage.deallocate(capacity: size)
   }
 }
 ```
 
 Your image should be able to set and get individual pixel values as well as set all the values at once. Typical usage:
 
 ```swift
 var image1 = Image(width: 4, height: 4, value: 0)
 
 // test setting and getting
 image1[0,0] // -> 0
 image1[0,0] = 100
 image1[0,0] // -> 100
 image1[1,1] // -> 0
 
 // copy
 var image2 = image1
 image2[0,0] // -> 100
 image1[0,0] = 2
 image1[0,0] // -> 2
 image2[0,0] // -> 100 because of copy-on-write
 
 var image3 = image2
 image3.clear(with: 255)
 image3[0,0] // -> 255
 image2[0,0] // -> 100 thanks again, copy-on-write
 ```

 */

private class Pixels {
  let size: Int
  let storage: UnsafeMutablePointer<UInt8>
  
  init(size: Int, value: UInt8) {
    self.size = size
    storage = UnsafeMutablePointer<UInt8>.allocate(capacity: size)
    storage.initialize(from: repeatElement(value, count: size))
  }

  init(pixels: Pixels) {
    self.size = pixels.size
    storage = UnsafeMutablePointer<UInt8>.allocate(capacity: size)
    storage.initialize(from: pixels.storage, count: pixels.size)
  }
  
  subscript(offset: Int) -> UInt8 {
    get {
      return storage[offset]
    }
    set {
      storage[offset] = newValue
    }
  }
  
  deinit {
    storage.deallocate(capacity: size)
  }
}

struct Image {
  private (set) var width: Int
  private (set) var height: Int
  private var pixels: Pixels
  private var mutatingPixels: Pixels {
    mutating get {
      if !isKnownUniquelyReferenced(&pixels) {
        pixels = Pixels(pixels: pixels)
      }
      return pixels
    }
  }

  init(width: Int, height: Int, value: UInt8) {
    self.width = width
    self.height = height
    self.pixels = Pixels(size: width*height, value: value)
  }
  
  subscript(x: Int, y: Int) -> UInt8 {
    get {
      return pixels[y*width+x]
    }
    set {
      mutatingPixels[y*width+x] = newValue
    }
  }
  
  mutating func clear(with value: UInt8) {
    mutatingPixels.storage.initialize(from: repeatElement(value, count: width*height))
  }
}

var image1 = Image(width: 4, height: 4, value: 0)

// test setting and getting
image1[0,0] // -> 0
image1[0,0] = 100
image1[0,0] // -> 100
image1[1,1] // -> 0

// copy
var image2 = image1
image2[0,0] // -> 100
image1[0,0] = 2
image1[0,0] // -> 2
image2[0,0] // -> 100 because of copy-on-write

var image3 = image2
image3.clear(with: 255)
image3[0,0] // -> 255
image2[0,0] // -> 100 thanks again, copy-on-write

/*: 
 ### Challenge B
 
 If you were Apple and wanted to modify `UIImage` to replace it with a value type that had the mutating functions described above, could you do this in a way that is backward compatible with code which uses the existing `UIImage` API?
 */

// Yes.  Because UIImage is already immutable, it already has value semantics.  Using a copy-on-write implementation you could introduce mutating methods while preserving value semantics. Since adding mutability to its API would only be adding new behaviors, rather than modifying existing ones, this would be backward-compatible with existing use sites.

/*:
 ### Challenge C
 
 Consider the test snippet used to determine if a type has value semantics. What would you need to do in order to define an automatic means to test if a type supports value semantics? If someone hands you a type, can you know for sure if it offers value semantics? What if you cannot see its implementation? Could the compiler be expected to know?
 */

/* The test snippet defines an _operational_ test of value semantics. The recipe for value semantic constitutes a more limited _deductive_ test. What is the potential for automating either of these?
 
 The operational test would be challenging to automate. Just as it is difficult to prove something does not exist (because you might not have looked hard enough yet) it is difficult to *prove* value semantics. As soon as some interaction with a variable has a side-effect on another variable, then you have shown the variable is not of a value semantic type. But how could you ever know that you have tried all possible interactions? One could imagine automatic tests that tried a large variety of random interactions, to see if one generated side-effects, but this would not be a comprehensive test. Similarly, one detects side-effects in the code snippet by seeing changes in the value of a variable. To automate this would require an automated way to determine the value of a variable, which would be difficult to do explicitly for types which do not define an `Equatable` implementation based on their contents.
 
 A deductive test of value semantics, based on the recipe for value semantics, would also be imperfect. In particular cases 1-3 appear to be possible to check automatically, since they amount to checking relatively simple aspects of types and their properties, questions like "is it a primitive value type?", "Are all the properties constant?", etc.. However, case 4, the case of value types containing mutable reference types, seems less susceptible to automated verification.
 
 */

