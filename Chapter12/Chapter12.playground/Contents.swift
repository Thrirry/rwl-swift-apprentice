//: Playground - noun: a place where people can play

//Properties
import Foundation

struct Car{
    let make: String
    let color: String
}

struct Contact{
    //Stored property
    var fullName: String
    var emailAddress: String
}

var person = Contact(fullName: "Hoff Silva", emailAddress: "hoff.henry@gmail.com")

let name = person.fullName
let emailAddress = person.emailAddress

person.fullName = "Grace Hopper"

let grace = person.fullName


struct TV{
    var height: Double
    var width: Double
    
    //1 Computed Property - read-only
    var diagonal: Int{
        //2
        let result = sqrt(height*height + width*width)
        //3
        let roundedResult = result.rounded()
        //4
        return Int(roundedResult)
    }
    
    //1 Computed Property - read-write
    var diagonaRW: Int{
        get{
            let result = sqrt(height*height + width*width)
            let roundedResult = result.rounded()
            return Int(roundedResult)
        }
        set {
            let ratioWidth = 10.6
            let ratioHeight = 9.0
            height = Double(newValue) * ratioHeight / sqrt(ratioWidth * ratioWidth + ratioHeight * ratioHeight)
            width = height * ratioWidth / ratioHeight
        }
    }
}

var tv = TV(height: 53.93, width: 95.87)

let size = tv.diagonal

tv.width = tv.height
let diagonal = tv.diagonal

//Computed properties can be read-only or read-write

//Type properties

struct Level {
    let id: Int
    var boss: String
    var unlocked: Bool
}

let l1 = Level(id: 1, boss: "Chamaleon", unlocked: true)
let l2 = Level(id: 2, boss: "Squid", unlocked: false)

struct LevelWithItSelf {
    //type property
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool
}

let lwis1 = LevelWithItSelf(id: 1, boss: "Chamaleon", unlocked: true)
//let highestLevel = lwis1.highestLevel//Erro: esta propriedade nao pode ser usada numa instancia.
let highestLevel = LevelWithItSelf.highestLevel

//Property Observers

struct LevelWithPropertyObserver{
    //type property
    static var highestLevel = 1
    //stored properties
    let id: Int
    var boss: String
    //property observer
    var unlocked: Bool {
        didSet{
            if unlocked && id > LevelWithPropertyObserver.highestLevel {
                LevelWithPropertyObserver.highestLevel = id
            }
            print("didSet")
        }
        willSet{
            print("willSet")
        }
    }
}


var lwpo = LevelWithPropertyObserver(id: 1, boss: "DV", unlocked: true)
lwpo.unlocked = true
LevelWithPropertyObserver.highestLevel

//Limiting a variable
struct LightBulb{
    static let maxCurrent = 40
    var current = 0 {
        didSet{
            if current > LightBulb.maxCurrent{
                print("Current too high, falling back to previous setting.")
                current = oldValue
            }
        }
    }
}

var light = LightBulb()
light.current = 50
var current = light.current
light.current = 40
current = light.current





