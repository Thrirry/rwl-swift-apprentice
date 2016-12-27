// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

import Foundation

public class CheckingAccount: BasicAccount {
  private let accountNumber = UUID().uuidString
  
  fileprivate var issuedChecks: [Int] = []
  fileprivate var currentCheck = 1
  
  public override init() { }
  
  public class Check {
    let account: String
    var amount: Dollars
    private(set) var cashed = false
    
    func cash() {
      cashed = true
    }
    
    fileprivate init(amount: Dollars, from account: CheckingAccount) {
      self.amount = amount
      self.account = account.accountNumber
    }
  }
  
  public func writeCheck(amount: Dollars) -> Check? {
    guard balance > amount else {
      return nil
    }
    
    let check = Check(amount: amount, from: self)
    withdraw(amount: check.amount)
    return check
  }
  
  public func deposit(check: Check) {
    guard !check.cashed else {
      return
    }
    
    deposit(amount: check.amount)
    check.cash()
  }
}

private extension CheckingAccount {
  func inspectForFraud(with checkNumber: Int) -> Bool {
    return issuedChecks.contains(checkNumber)
  }
  
  func nextNumber() -> Int {
    let next = currentCheck
    currentCheck += 1
    return next
  }
}

extension CheckingAccount: CustomStringConvertible {
  public var description: String {
    return "Checking Balance: $\(balance)"
  }
}
