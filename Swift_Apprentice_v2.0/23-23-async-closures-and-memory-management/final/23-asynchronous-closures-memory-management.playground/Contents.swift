// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation
import PlaygroundSupport

class Tutorial {
  let title: String
  let category: String
  let date: Date
  unowned let author: Author
  var editor: Editor?
 
  init(title: String, category: String, author: Author, date: Date) {
    self.title = title
    self.category = category
    self.author = author
    self.date = date
  }
  
  lazy var tutorialDescription: () -> String = {
    [unowned self] in
    return "\(self.title) \(self.category)"
  }
  
  deinit {
    print("Goodbye \(title)!")
  }
}

class Editor {
  let name: String
  let email: String
  weak var tutorial: Tutorial?
  
  init(name: String, email: String) {
    self.name = name
    self.email = email
  }
  
  deinit {
    print("Goodbye \(name)!")
  }
}

class Author {
  let name: String
  let email: String
  var tutorial: Tutorial?
  
  init(name: String, email: String) {
    self.name = name
    self.email = email
  }
  
  deinit {
    print("Goodbye \(name)!")
  }
}

var author: Author? = Author(name: "Cosmin", email: "cosmin@whatever.com")
var tutorial: Tutorial? = Tutorial(title: "Memory management", category: "Swift", author: author!, date: Date())
print(tutorial!.tutorialDescription())
var editor: Editor? = Editor(name: "Ray", email: "ray@whatever.com")

author?.tutorial = tutorial
tutorial?.editor = editor
editor?.tutorial = tutorial

author = nil
tutorial = nil
editor = nil

var counter = 0
var closure = { print(counter) }
counter = 1
closure()

counter = 0
closure = { [counter] in print(counter) }
counter = 1
closure()

func log(message: String) {
  let thread = Thread.current.isMainThread ? "Main" : "Background"
  print("\(thread) thread: \(message)")
}

func addNumbers(range: Int) -> Int {
  log(message: "Adding numbers...")
  return (1...range).reduce(0, +)
}

let queue = DispatchQueue(label: "queue")

func execute<T>(backgroundWork: @escaping () -> T, mainWork: @escaping (T) -> ()) {
  queue.async {
    let result = backgroundWork()
    DispatchQueue.main.async {
      mainWork(result)
    }
  }
}

PlaygroundPage.current.needsIndefiniteExecution = true

execute(backgroundWork: { addNumbers(range: 100) },
        mainWork:  { log(message: "The sum is \($0)") })

extension Editor {
  var feedback: String {
    let tutorialStatus: String
    if arc4random_uniform(10) % 2 == 0 {
      tutorialStatus = "published"
    } else {
      tutorialStatus = "rejected"
    }
    return "Tutorial \(tutorialStatus) by \(self.name)"
  }
  
  func editTutorial() {
    queue.async() {
      [weak self] in
      
      guard let strongSelf = self else {
        return
      }
      DispatchQueue.main.async {
        print(strongSelf.feedback)
      }
    }
  }
}
