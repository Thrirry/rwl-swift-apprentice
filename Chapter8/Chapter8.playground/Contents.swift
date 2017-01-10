//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = ["Hoff","Mariana", "Marina", "Judah"]

let indexOfMariana = str.index(of: "Mariana")
//print(indexOfMariana)

str[1] = "MarianaLinda"

print(indexOfMariana!)

/*
 Challenges
1 -  Which of the following are valid statements?
 */
let array1 = [Int]() //valid
//let array2 = [] //Invalid
let array3 : [String] = []  //Valid

/*
 For the next five statements, array4 has been declared as:
 */
let array4 = [1, 2, 3]
print(array4[0]) //Ok!
//print(array4[5]) //Erro, array nao tem essa posicao.
array4[1...2]
//array4[0] = 4 erro de constante!
//array4.append(4) erro de constante!

//For the final five statements, array5 has been declared as:

var array5 = [1,2,3,4,5,6,7,8,9,10,11,12,13,15]
array5[0] = array5[1]
array5[0...1] = [4,5]
//array5[0] = six erro de tipagem, um array de inteiros nao pode ter um dado do tipo string
//array5 += 7 da erro poi o valor nao é um elemento de array
for item in array5.enumerated(){
    print(item.offset)
}

// 2 - Write a function that removes the first occurrence or a given integer form an array of integers. The signature of the function:
func removingOnce(_ item: Int, from array: [Int]) -> [Int]{
    var result = array
    if let index = array.index(of: item){
        result.remove(at: item)
    }
    return result
}
removingOnce(0, from: array5)

// 3 - Write a function that removes all occurrences of a given integer from an array of integers. 
var array6 = [1,2,3,3,3,4,5,6,3,3]
func removing(_ item: Int,  from array: [Int]) -> [Int]{
    var result : [Int] = []
    for itemFrom in array {
        if item != itemFrom{
            result.append(itemFrom)
        }
    }
    return result
}

removing(3, from: array6)

// 4 - Write a functio that does the same thing that reversed() do.



func reversed(_ array: [Int]) -> [Int]{
    var newArray : [Int] = []
    var array = array
    for item in array {
        newArray.append(array.last!)
        array.removeLast()
    }
    return newArray
}

reversed(array6)

// 5 - Use the function below to write a function that shuffles the elements of an array in random order

func randomFromZero(to number: Int) -> Int{
    return Int(arc4random_uniform(UInt32(number)))
}

func randomized(_ array: [Int]) -> [Int]{
    var newArray = array
    for item in array.enumerated() {
        newArray[randomFromZero(to: array.count)] = item.element
    }
    return newArray
}

randomized(array6)

// 6 - Write a func that calculates the max and min value in an array of integers. Calculate the values yourself; dont use the methods min and max. Return nil if the given array is empty

func minMax(of numbers: [Int]) -> (min: Int, max: Int)?{
    var max = numbers[0]
    var min = numbers[0]
    for item in numbers {
            if item < min{
                min = item
            }else{
                max = item
            }
    }
    
    return (min, max)
}

minMax(of: array5)
		
