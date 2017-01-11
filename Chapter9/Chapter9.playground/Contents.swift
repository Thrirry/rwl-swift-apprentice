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

