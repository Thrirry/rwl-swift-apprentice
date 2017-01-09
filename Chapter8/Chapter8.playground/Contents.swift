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

var array5 = [1,2,3]
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

// 3 - 
		
