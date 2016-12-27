// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

/*:
## Advanced Control Flow
### Question 1

 In the following for loop:
 
```
var sum = 0
for i in 0...5 {
  sum += i
}
```
What will be the value of sum, and how many iterations will happen?
 */
var sum = 0
for i in 0...5 {
  sum += i
}
sum
 
// sum = 15, 6 iterations (0, 1, 2, 3, 4, 5)

/*:
 ### Question 2
 
 In the while loop below:
 ````
 var aLotOfAs = ""
 while aLotOfAs.characters.count < 10 {
  aLotOfAs += "a"
 }
 ````
 How many instances of the character “a” will there be in aLotOfAs? Hint: aLotOfAs.characters.count will tell you how many characters there are in the string aLotOfAs.
*/
var aLotOfAs = ""
while aLotOfAs.characters.count < 10 {
  aLotOfAs += "a"
}
aLotOfAs
aLotOfAs.characters.count
// aLotOfAs contains 10 instances of "a"

/*:
 ### Question 3
 Consider the following switch statement:
 
 ```
 switch coordinates {
 case let (x, y, z) where x == y && y == z:
   print("x = y = z")
 case (_, _, 0):
   print("On the x/y plane")
 case (_, 0, _):
   print("On the x/z plane")
 case (0, _, _):
   print("On the y/z plane")
 default:
   print("Nothing special")
 }
 ```

 What will this code print when coordinates is each of the following?
 ```
     let coordinates = (1, 5, 0)
     let coordinates = (2, 2, 2)
     let coordinates = (3, 0, 1)
     let coordinates = (3, 2, 5)
     let coordinates = (0, 2, 4)
 ```
 */

let coordinates = (1, 5, 0)
// "On the x/y plane"

//let coordinates = (2, 2, 2)
// "x = y = z"

//let coordinates = (3, 0, 1)
// "On the x/z plane"

//let coordinates = (3, 2, 5)
// "Nothing special"

//let coordinates = (0, 2, 4)
// "On the y/z plane"

switch coordinates {
case let (x, y, z) where x == y && y == z:
  print("x = y = z")
case (_, _, 0):
  print("On the x/y plane")
case (_, 0, _):
  print("On the x/z plane")
case (0, _, _):
  print("On the y/z plane")
default:
  print("Nothing special")
}

/*:
 ### Question 4
 A closed range can never be empty. Why?
*/

// Ranges must always be increasing.  With a closed range the second number is always included in the range.

let halfOpenRange = 100..<100 // empty
let closedRange = 100...100   // contains the number 100

halfOpenRange.isEmpty
closedRange.isEmpty

/*:
 ### Question 5
 Print a countdown from 10 to 0.  (Note: do not use the `reversed()` method, which will be introduced later.)
*/

var value = 10
for counter in 0...10 {
  print(value)
  value -= 1
}

/*:
 ### Question 6
 
 Print 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0.  (Note: do not use the `stride(from:to:by:)` function, which will be introduced later.)
*/

var  value1 = 0.0

for counter in 0...10 {
  print(value1)
  value1 += 0.1
}

// Alternate solution
for counter in 0...10 {
  print(Double(counter)*0.1)
}
