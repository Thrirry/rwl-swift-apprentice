//: Playground - noun: a place where people can play

import UIKit
import Foundation

/*
 Mini-exercises
 1. Create a variable called range and set it equal to a range starting at 1 and ending with 10 inclusive. Write a for loop which iterates over this range and prints the square of each number.
 */
var range = 0...10

elevateNumberFor: for number in range{
    print("\(number)ˆ2 = \(number * number)")
}
print()
/*
 2. Write a for loop which iterates over the same range as in the exercise above and prints the square root of each number. Hint: you will need to type convert your loop variable.
 */

squareRootFor: for number in range{
    print("√\(number) = \(sqrt(Double(number)))")
}
print()
/*
 3. Above,you saw a for loop which iterated over only the even rows like so:
 var sum = 0
 for row in 0..<8 {
    if row % 2 == 0 {
        continue
    }
    for column in 0..<8 {
        sum += row * column
    }
 }
 Change this to use a where clause on the first for loop to skip even rows instead of using continue. Check that the sum is 448 as in the initial example.
 */

var sumOfForWhere = 0
var rangeOfForWhere = 0..<8
forWhere: for row in rangeOfForWhere where row % 2 != 0{
    for column in rangeOfForWhere {
        sumOfForWhere += row * column
    }
}
print(sumOfForWhere)
print()
/*
 Mini-exercises
 1. Write a switch statement that takes an age as an integer and prints out the life stage related to that age. You can make up the life stages, or use my categorization as follows: 0-2 years, Infant; 3-12 years, Child; 13-19 years, Teenager; 20-39, Adult; 40-60, Middle aged; 61+, Elderly.
 */

var age = 30

switch age {
case 0...2:
    print("You are Infant")
case 3...12:
    print("You are Child!")
case 13...19:
    print("You are Teenager")
case 20...39:
    print("You are Adult")
case 40...60:
    print("You are Middle aged")
case 61...110:
    print("You are Elderly")
default:
    print("Anybody have this age!")
}
print()

/*
 2. Write a switch statement that takes a tuple containing a string and an integer. The string is a name, and the integer is an age. Use the same cases that you used in the previous exercise and let syntax to print out the name followed by the life stage. For example, for myself it would print out "Matt is an adult.".
 */

var tupleToSwitch = (name: "", age: 0)
tupleToSwitch.age = 30
tupleToSwitch.name = "Hoff"

switch tupleToSwitch {
case (_, 0...2):
    print("\(tupleToSwitch.name) is Infant")
case (_, 3...12):
    print("\(tupleToSwitch.name) is Child!")
case (_, 13...19):
   print("\(tupleToSwitch.name) is Teenager")
case (_, 20...39):
    print("\(tupleToSwitch.name) is Adult")
case (_, 40...60):
    print("\(tupleToSwitch.name) is Middle aged")
case (_, 61...110):
    print("\(tupleToSwitch.name) is Elderly")
default:
    print("Anybody have this age!")
}



