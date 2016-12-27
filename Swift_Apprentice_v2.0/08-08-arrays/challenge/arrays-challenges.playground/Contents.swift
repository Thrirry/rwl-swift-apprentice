// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

/*:
 ## Arrays
 ### Question 1.
 Which of the following are valid statements?
*/
 
let array1 = [Int]() // Valid
//let array2 = [] // Invalid: the type cannot be inferred
let array3: [String] = [] // Valid

//: Given:
let array4 = [1, 2, 3]

//: Which of the following five statements are valid

print(array4[0]) // Valid
//print(array4[5]) // Will compile, but will cause an error at runtime: index out of bounds
array4[1...2] // Valid
//array4[0] = 4 // Invalid: a constant array cannot be modified
//array4.append(4) // Invalid: a constant array cannot be modified

//: Given:
var array5 = [1, 2, 3]

//: Which of the five statements are valid?

array5[0] = array5[1]  // Valid
array5[0...1] = [4, 5] // Valid
//array5[0] = "Six" // Invalid: an element of type String cannot be added to an array of type [Int]
//array5 += 6 // Invalid: the += operator requires an array on the right-hand side, not a single element
for item in array5 { print(item) }  // Valid

/*:
 ### Question 2
 Write a function that removes all occurrences of a given integer from an array of integers. 
 This is the signature of the function:
 
 ```
 func removingOnce(item: Int, from array: [Int]) -> [Int]
 ```
*/

func removingOnce(_ item: Int, from array: [Int]) -> [Int] {
  var result = array
  if let index = array.index(of: item) {
    result.remove(at: index)
  }
  return result
}

/*:
 ### Question 3
 Write a function that removes all occurrences of a given integer from an array of integers. 
 This is the signature of the function:
 
```
 func removing(item: Int, from array: [Int]) -> [Int]
```
*/

func removing(_ item: Int, from array: [Int]) -> [Int] {
  var newArray: [Int] = []
  for candidateItem in array {
    if candidateItem != item {
      newArray.append(candidateItem)
    }
  }
  return newArray
}

/*:
 ### Question 4
 Arrays have a `reversed()` method that returns an array holding the same elements as the original array, in reverse order. 
 Write a function that does the same thing, without using `reversed()`. This is the signature of the function:

 ```
 func reversed(array: [Int]) -> [Int]
 ```
*/

func reversed(_ array: [Int]) -> [Int] {
  var newArray: [Int] = []
  for item in array {
    newArray.insert(item, at: 0)
  }
  return newArray
}


/*:
 ### Question 5
 The function below returns a random number between 0 and the given argument: 
 */

import Foundation
func randomFromZero(to number: Int) -> Int {
  return Int(arc4random_uniform(UInt32(number)))
}

/*:
 ### Question 6
 
 Use it to write a function that shuffles the elements of an array in random order. 
 This is the signature of the function:

```
 func randomized(_ array: [Int]) -> [Int]
```
*/

func randomized(_ array: [Int]) -> [Int] {
  var newArray = array
  for index in 0..<array.count {
    let randomIndex = randomFromZero(to: array.count)
    let value = newArray[randomIndex]
    newArray[randomIndex] = newArray[index]
    newArray[index] = value
  }
  return newArray
}


/*:
 ### Question 7
 
 Write a function that calculates the minimum and maximum value in an array of integers. 
 Calculate these values yourself, do not use the methods `min` and `max`. 
 Return `nil` if the given array is empty.
 
 This is the signature of the function:

```
func minMax(of numbers: [Int]) -> (min: Int, max: Int)?
```
 
 */
func minMax(of numbers: [Int]) -> (min: Int, max: Int)? {
  if numbers.isEmpty {
    return nil
  }

  var min = numbers[0]
  var max = numbers[0]
  for number in numbers {
    if number < min {
      min = number
    }
    if number > max {
      max = number
    }
  }
  return (min, max)
}
