// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

public struct Person {
  public private(set) var first: String
  public private(set) var last: String
  
  public init(first: String, last: String) {
    self.first = first
    self.last = last
  }
  
  public var fullName: String {
    return "\(first) \(last)"
  }
}

open class ClassyPerson {
  public private(set) var first: String
  public private(set) var last: String
  
  public init(first: String, last: String) {
    self.first = first
    self.last = last
  }
  
  open var fullName: String {
    return "\(first) \(last)"
  }
}
