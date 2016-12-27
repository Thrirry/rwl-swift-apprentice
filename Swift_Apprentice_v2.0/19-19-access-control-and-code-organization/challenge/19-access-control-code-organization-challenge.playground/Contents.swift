// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

//: Challenge A

class Logger {
  
  // A private initializer is required to restrict instantiation so only the class itself can create objects.
  private init() {}
  
  // The single, shared instance.
  static let sharedInstance = Logger()
  
  func log(_ text: String) {
    print(text)
  }
}

Logger.sharedInstance.log("Hello, Swift!")

//Logger().log("Can't do this :)") // Can't be instantiated outside of `Logger`

//: Challenge B:

struct Stack<Element> {
  
  private var elements: [Element] = []
  
  var count: Int {
    return elements.count
  }
  
  func peek() -> Element? {
    return elements.last
  }
  
  mutating func push(_ element: Element) {
    elements.append(element)
  }
  
  mutating func pop() -> Element? {
    if elements.isEmpty {
      return nil
    }
    return elements.removeLast()
  }
}

var strings = Stack<String>()

strings.push("Great!")
strings.push("is")
strings.push("Swift")

//strings.elements.removeAll() // The implementation details of `Stack` are hidden.

strings.peek()

while let string = strings.pop() {
  Logger.sharedInstance.log(string)
}

//: Challenge C

let elf = GameCharacterFactory.make(ofType: .elf)
let giant = GameCharacterFactory.make(ofType: .giant)
let wizard = GameCharacterFactory.make(ofType: .wizard)

battle(elf, vs: giant)
battle(wizard, vs: giant)
battle(wizard, vs: elf)
