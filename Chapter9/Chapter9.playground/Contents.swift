//: Playground - noun: a place where people can play

import UIKit
import Foundation

var namesAndScores = ["Anna" : 2, "Brian" : 2, "Craig" : 8, "anna" : 3, "Donna" : 6 ] //String : Int
var emptyDictionary : [String: Int] = [:]
print()

var hoff = ["nome" : "Hoff Silva", "celular" : 61991212700, "cidade" : "Brasilia", "estado" : "Distrito Federal", "pais" : "Brasil"] as [String : Any]
var mariana = ["nome" : "Mariana Camara", "celular" : 61992756914, "cidade" : "Brasilia", "estado" : "Distrito Federal", "pais" : "Brasil"] as [String : Any]

var name = "Anna"
if let score = namesAndScores[name] {
    print(score)
}else{
    print("The \(name) isn't a dictionary key.")
}

namesAndScores.isEmpty
namesAndScores.count
for item in namesAndScores.enumerated() {
  print(item.offset)
}
Array(namesAndScores.keys)
Array(namesAndScores.values)

namesAndScores.updateValue(4, forKey: "Anna")
namesAndScores[name]

func printUserData(_ user: [String : Any] ){
    if let cidade = user["cidade"] {
        print(cidade)
    }
    if let estado = user["estado"] {
        print(estado)
    }
}
printUserData(mariana)

mariana["estado"] = "DF"

printUserData(mariana)

//Challenges

// 1 - Which of the following are valid statements?
//let dict1 : [Int, Int] = [:] - Invalid
//let dict2 = [:] - Invalid
let dict3 : [Int: Int] = [:]

//for the next four statements, use the following dictionary:
let dict4 = ["One" : 1, "Two" : 2, "Three" : 3]
//dict4[1] - Invalid
dict4["One"]
//dict4["Zero"] = 0 - Invalid. Its would be only dict4 be var.
//dict4[0] = "Zero" - Invalid.

//for the next three statements, use the following dictionary:
var dict5 = ["NY" : "New York", "CA" : "California"]
var dict6 = ["ND" : "Nevada", "TX" : "Texas", "DF" : "Distrito Federal"]

dict5["NY"]
dict5["WA"] = "Washington"
//dict5["CA"] = nil

// 2 - Replacing dictionary values:
// Write a function that swaps the value of two keys in dictionary. This is the function's signature:

func swappingValueForKeys(_ key1: String, _ key2: String, in dictionary: [String: Int]) -> [String:Int]{
    var dic = dictionary
    if let temp = dic[key1] {
        if let temp2 = dic[key2] {
            dic[key1] = temp2
            dic[key2] = temp
        }else{
            print("Erro!")
        }
    }else{
        print("Erro!")
    }
    return dic
}

swappingValueForKeys("One", "Two", in: dict4)

// 3 - Given a dictionary with two-letter state codes as keys, and the full state names as value, write a function that prints all the states with names longer than eight characters. For example, for the dictionary dict5, the output would be California.

func printStateLongerThanEigth(_ dictionary : [String: String]) -> [String]{
    var array : [String] = []
    for stateName in dictionary.values{
        if stateName.characters.count > 8 {
            array.append(stateName)
        }
    }
    return array
}

printStateLongerThanEigth(dict5)

// 4 - Write a function that combines two dictionaries into one. If a certain key apperars in both dictioanries, ignore the pair from the first dictionay. This is the function's signature:
func merging(_ dict1: [String: String], with dict2: [String: String]) -> [String: String]{
    
    var mergedDictonary : [String: String] = ["":""]
    let dict1Size = dict1.count
    let dict2Size = dict2.count
    
    if dict1Size >= dict2Size {
        for itemD1 in dict1 {
            for itemD2 in dict2 {
                if itemD1.key == itemD2.key {
                    mergedDictonary[itemD1.key] = itemD1.value
                }else{
                    mergedDictonary[itemD1.key] = itemD1.value
                    mergedDictonary[itemD2.key] = itemD2.value
                }
            }
        }
    }else{
        for itemD2 in dict2 {
            for itemD1 in dict1 {
                if itemD2.key == itemD1.key {
                    mergedDictonary[itemD2.key] = itemD2.value
                }else{
                    mergedDictonary[itemD2.key] = itemD2.value
                    mergedDictonary[itemD1.key] = itemD1.value
                }
            }
        }
    }
    
    return mergedDictonary
}

print(merging(dict5, with: dict6))
