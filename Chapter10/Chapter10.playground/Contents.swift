//: Playground - noun: a place where people can play

import UIKit
import Foundation

//Closures 

//Basic syntax

var multiplyClosure : (Int, Int) -> Int

multiplyClosure = {(a: Int, b: Int) -> Int in
    return a * b
}

let result = multiplyClosure(4, 2)

//Shorthand syntax

multiplyClosure = {(a : Int, b : Int) -> Int in
    //We don't need the 'return' when we have only one expression.
    a * b
}
