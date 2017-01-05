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
var timesOfDivision = divideIfWhole(10, by: 2) ?? 0
//if timesOfDivision == nil{

