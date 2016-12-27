/*:
Write a default implementation on `CustomStringConvertible` that will simply remind you to implement `description` by returning `Remember to implement CustomStringConvertible!`.

In other words, once you have your default implementation, you should be able to write code like this:

    struct MyStruct: CustomStringConvertible {}
    print(MyStruct())

should print "Remember to implement CustomStringConvertible!"
*/

extension CustomStringConvertible {
  var description: String {
    return "Hey, remember to implement CustomStringConvertible!"
  }
}

struct MyStruct: CustomStringConvertible {
    
}

let myStruct = MyStruct()
print(myStruct)

// Write a default implementation on `CustomStringConvertible` that will print the win/loss record in the format `Wins - Losses` for any `TeamRecord` type. For instance, if a team is 10 and 5, it should return `10 - 5`.

protocol TeamRecord {
  var wins: Int { get }
  var losses: Int { get }
  func winningPercentage() -> Double
}


extension CustomStringConvertible where Self: TeamRecord {
  var description: String {
    return "\(wins) - \(losses)"
  }
}

struct BaseballRecord: TeamRecord {
  var wins: Int
  var losses: Int
  
  func winningPercentage() -> Double {
    return Double(wins) / Double(wins) + Double(losses)
  }
}

extension BaseballRecord: CustomStringConvertible { }



print(BaseballRecord(wins: 4, losses: 2))
