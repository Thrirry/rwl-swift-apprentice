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




