// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

//: Protocol extensions

extension String {
  func shout() {
    print(uppercased())
  }
}

"Swift is pretty cool".shout()

//: ### Introducing protocol extensions

protocol TeamRecord {
  var wins: Int { get }
  var losses: Int { get }
  var winningPercentage: Double { get }
}

extension TeamRecord {
  var gamesPlayed: Int {
    return wins + losses
  }
}

struct BaseballRecord: TeamRecord {
  var wins: Int
  var losses: Int
  
  var winningPercentage: Double {
    return Double(wins) / (Double(wins) + Double(losses))
  }
}

let sanFranciscoSwifts = BaseballRecord(wins: 10, losses: 5)
sanFranciscoSwifts.gamesPlayed // 15

//: ### Default implementations

extension TeamRecord {
  var winningPercentage: Double {
    return Double(wins) / (Double(wins) + Double(losses))
  }
}

struct BasketballRecord: TeamRecord {
  var wins: Int
  var losses: Int
  let seasonLength = 82
}

let minneapolisFunctors = BasketballRecord(wins: 60, losses: 22)
minneapolisFunctors.winningPercentage

struct HockeyRecord: TeamRecord {
  var wins: Int
  var losses: Int
  var ties: Int
  
  var winningPercentage: Double {
    return Double(wins) / (Double(wins) + Double(losses) + Double(ties))
  }
}

let chicagoOptionals = BasketballRecord(wins: 10, losses: 6)
let phoenixStridables = HockeyRecord(wins: 8, losses: 7, ties: 1)

chicagoOptionals.winningPercentage
phoenixStridables.winningPercentage

//: ### Understanding protocol extension dispatching

protocol WinLoss {
  var wins: Int { get }
  var losses: Int { get }
}

extension WinLoss {
  var winningPercentage: Double {
    return Double(wins) / (Double(wins) + Double(losses))
  }
}

struct CricketRecord: WinLoss {
  var wins: Int
  var losses: Int
  var draws: Int
  
  var winningPercentage: Double {
    return Double(wins) / (Double(wins) + Double(losses) + Double(draws))
  }
}

let miamiTuples = CricketRecord(wins: 8, losses: 7, draws: 1)
let winLoss: WinLoss = miamiTuples

miamiTuples.winningPercentage // .5
winLoss.winningPercentage // .53 !!!

//: ### Type constraints

protocol PostSeasonEligible {
  var minimumWinsForPlayoffs: Int { get }
}

extension TeamRecord where Self: PostSeasonEligible {
  var isPlayoffEligible: Bool {
    return wins > minimumWinsForPlayoffs
  }
}

protocol Tieable {
  var ties: Int { get }
}

extension TeamRecord where Self: Tieable {
  var winningPercentage: Double {
    return Double(wins) / (Double(wins) + Double(losses) + Double(ties))
  }
}

struct RugyRecord: TeamRecord, Tieable {
  var wins: Int
  var losses: Int
  var ties: Int
}

let rugbyRecord = RugyRecord(wins: 8, losses: 7, ties: 1)
rugbyRecord.winningPercentage // .500

//: ### Traits, mixins, and multiple inheritance

protocol TieableRecord {
  var ties: Int { get }
}

protocol DivisionalRecord {
  var divisionalWins: Int { get }
  var divisionalLosses: Int { get }
}

protocol ScoreableRecord {
  var totalPoints: Int { get }
}

extension ScoreableRecord where Self: TieableRecord, Self: TeamRecord {
  var totalPoints: Int {
    return (2 * wins) + (1 * ties)
  }
}

struct NewHockeyRecord: TeamRecord, TieableRecord, DivisionalRecord,
  CustomStringConvertible, Equatable {
  var wins: Int
  var losses: Int
  var ties: Int
  var divisionalWins: Int
  var divisionalLosses: Int
  
  var description: String {
    return "\(wins) - \(losses) - \(ties)"
  }
  
  static func ==(lhs: NewHockeyRecord, rhs: NewHockeyRecord) -> Bool {
    return lhs.wins == rhs.wins &&
      lhs.ties == rhs.ties &&
      lhs.losses == rhs.losses
  }
}
