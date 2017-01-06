//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

var myFavoriteSong : String?

myFavoriteSong = ""

let parsedInt = Int("10")
//is optional because the string can be a empty.


if  myFavoriteSong == nil{
    myFavoriteSong = "String"
}else{
    myFavoriteSong = nil
}

/*
 Challenges
 
 Challenge A: You be the compiler
 Which of the following are valid statement?
 var name: String? = "Ray" Valid
 var age: Int = nil Invalid
 let distance: Float = 26.7 Valid
 var middleName: String? = nil Valid
 
 */

/*
 Challenge B: Divide and conquer
 
 */

func divideIfWhole(_ value: Int, by divisor: Int) -> Int?{
    if value % divisor == 0{
        return value/divisor
    }
    return nil
}

if let ok = divideIfWhole(10988, by: 2){
    print("Yep, it divides \(ok) times")
}else{
    print("Not divisible! :[")
}

/*
 Challenge C: Refactor and reduce
 
 */
var timesOfDivision = divideIfWhole(10, by: 3) ?? 0
if timesOfDivision == 0{
    print("Zero times!")
}else{
    print("It divides \(timesOfDivision) times")
}

/*
 Challenge C: Nested optional
 
 */
let number : Int??? = 10

/*
 Fully force unrwap and print number:
 */
print(number!!!)

/*
 Optionally bind and print number with if let
 */

if let n1 = number{
    if let n2 = n1{
        if let n3 = n2 {
            print(n3)
        }
    }
}
/*
 Write a function printNumber(_ number : Int???) that uses quard to print the number only if it is bound.
 */

func printNumber(_ number: Int???){
    guard let n1 = number else {
        print("Vazio!")
        return
    }
    guard let n2 = n1 else {
        print("vazio 2")
        return
    }
    guard let n3 = n2 else {
        print("vazio")
        return
    }
    print(n3)
}

printNumber(20)
