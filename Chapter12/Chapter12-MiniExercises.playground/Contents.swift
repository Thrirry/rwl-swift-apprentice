//: Playground - noun: a place where people can play

import Foundation

struct ScreenSize{
    var height: Double
    var width: Double
    
    var diagonalSize: Int{
    
        let result = sqrt(height*height + width+width)
        
        let roundedResult = result.rounded()
        
        return Int(roundedResult)
        
    }
}

let myScreenSize = ScreenSize(height: 40, width: 70)
myScreenSize.diagonalSize

let myScreenSize2 = ScreenSize(height: 34, width: 34)
myScreenSize2.diagonalSize






