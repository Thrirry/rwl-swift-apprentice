//: Playground - noun: a place where people can play

import UIKit
import Foundation

var namesAndScores = ["Anna" : 2, "Brian" : 2, "Craig" : 8, "anna" : 3, "Donna" : 6 ] //String : Int
var emptyDictionary : [String: Int] = [:]
print()

var hoff = ["nome" : "Hoff Silva", "celular" : 61991212700, "cidade" : "Brasilia", "estado" : "Distrito Federal", "pais" : "Brasil", "numero" : 1] as [String : Any]
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

//<<<<<<< Updated upstream
// 1 - Which of the following are valid statements?
//let dict1 : [Int, Int] = [:] - Invalid
//let dict2 = [:] - Invalid
let dict3 : [Int: Int] = [:]

//for the next four statements, use the following dictionary:
let dict4 = ["One" : 1, "Two" : 2, "Three" : 3, "Four" : 4]
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

// 5 - Declare a function occurrencesOfCharacters that calculates which characters occurs in a string, as well as how often each these characters occurs. Return the result as a dictionary. This is the function signature:

func occurrencesOfCharacters(in text : String) -> [Character : Int]{
    var charactersReport = [Character: Int]()
    var cont = 0
    
    for character in text.characters {
        for char in text.characters {
            if char == character {
                cont += 1
                charactersReport[character] = cont
            }
        }
        cont = 0
    }
    return charactersReport
}
occurrencesOfCharacters(in:"mafagafo")

// 6 - Write a function that returns true if all of the values of a dictionay [String: Int] are unique. Use a dictionary to test uniqueness. This is a function signature:
func isInvertible(_ dictionary: [String : Int]) -> Bool{
    var cont = 0
    var retorno : Bool?
    for item in dictionary.values {
        for item in dictionary.values {
            if item == item {
                cont += 1
            }
        }
        if cont > 1 {
            retorno = false
            
        }else{
            retorno = true
        }
        cont = 0
    }
    return retorno!
}

isInvertible(dict4)

/*
 2. Replacingdictionaryvalues
 Write a function that swaps the values of two keys in a dictionary. This is the function’s signature:
 func swappingValuesForKeys(_ key1: String, _ key2: String, in dictionary: [String: Int]) -> [String: Int]
 */

func swappingValuesForKeys(_ key1: String, _ key2: String, in dictionary: [String: Int]) -> [String: Int]{
    var temp : Int?
    var dic = dictionary
    if let value = dictionary[key1] {
        temp = value
    }
    if let value = dictionary[key2] {
        dic[key2] = temp
        dic[key1] = value
    }
    
    return dic
}

swappingValuesForKeys("Anna", "Brian", in: namesAndScores)


//>>>>>>> Stashed changes


// 7 - Write an invert function that takes a dictionary[String:Int] and creates a new inverted dictionary [Int: String] where the values are the keys and the keys are the values. Note that for this function to work properly, the dictionary must be invertible. You can check this by using the function you created above to do precondition(isInvertible(input), "this dictionary can't be inverted") at the beginning of your function body. Your program will halt if this precondition is not met.This is the function signature:
func invert(_ input: [String: Int]) -> [Int: String]{
    return [1:""]
}
