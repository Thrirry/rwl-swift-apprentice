// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

func fibonacci(position: Int) -> Int {
  switch position {
  // 1
  case let n where n <= 1:
    return 0
  // 2
  case 2:
    return 1
  // 3
  case let n:
    return fibonacci(position: n - 1) + fibonacci(position: n - 2)
  }
}
let fib15 = fibonacci(position: 15) // 377

for i in 1...100 {
  // 1
  switch (i % 3, i % 5) {
  // 2
  case (0, 0):
    print("FizzBuzz", terminator: " ")
  case (0, _):
    print("Fizz", terminator: " ")
  case (_, 0):
    print("Buzz", terminator: " ")
  // 3
  case (_, _):
    print(i, terminator: " ")
  }
}
print("")

let matched = (1...10 ~= 5) // true

if case 1...10 = 5 {
  print("In the range")
}

let list = [0, 1, 2, 3]
let integer = 2

func ~=(pattern: [Int], value: Int) -> Bool {
  for i in pattern {
    if i == value {
      return true
    }
  }
  return false
}

let isInArray = (list ~= integer) // true

if case list = integer {
  print("The integer is in the array") // Printed!
} else {
  print("The integer is not in the array")
}
