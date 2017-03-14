//: Playground - noun: a place where people can play

import UIKit


//Declaring an enum
enum Month: Int{
    case january = 1
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    var semester: Season {
        switch self {
        case .august, .september, .october, .november, .december:
            return Season.autumn
        case .january, .february, .march, .april, .may:
            return Season.spring
        case .june, .january:
            return Season.summer
        default:
            return Season.notSchoolPeriod
        }
    }
    
    var monthsUntilWinterBreak: Int{
        return Month.december.rawValue - rawValue
    }
}

enum Season{
    case autumn
    case spring
    case notSchoolPeriod
    case summer
}

    var month = Month.april

    let semester = month.semester

func monthsUntilWinterBreak(from month: Month) -> Int{
    return Month.december.rawValue - month.rawValue
}


let fifthMonth = Month(rawValue: 5)!
monthsUntilWinterBreak(from: fifthMonth)

//String raw values

//1
enum Icon: String{
    case music
    case sports
    case weather
    
    var fileName: String{
        return "\(rawValue.capitalized).png"
    }
}

let icon = Icon.weather
icon.fileName

//Unordered raw values

enum Coin: Int{
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}

let coin = Coin.quarter
coin.rawValue

var arrayCoins: [Coin] = [.penny, .nickel, .dime, .quarter, .penny]

//Associated values

var balance = 100

func withDraw(amount: Int) -> WithDrawalResult{
    if amount <= balance {
        balance -= amount
        return .success(newBalance: balance)
    }else{
        return .error(message: "sdassasasasasas")
    }
    
}

enum WithDrawalResult{
    case success(newBalance: Int)
    case error(message: String)
}

let result = withDraw(amount: 99)
switch result {
case .success(let newBalance):
    print("Your new balance is: \(newBalance)")
case .error(let message):
    print(message)
}






		