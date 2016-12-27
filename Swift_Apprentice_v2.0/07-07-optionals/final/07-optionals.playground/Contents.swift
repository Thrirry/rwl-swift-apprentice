// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

var name = "Matt Galloway"
var age = 30
var occupation = "Software Developer & Author"

var errorCode: Int?
errorCode = 100
errorCode = nil

var result: Int? = 30
print(result)

//print(result + 1) // error: Value of optional type 'Int?' not unwrapped; did you mean to use '!' or '?'?

// IF-LET BINDING (AND FORCED UNWRAPPING)
var authorName: String? = "Matt Galloway"
var authorAge: Int? = 30

var unwrappedAuthorName = authorName!
print("Author is \(unwrappedAuthorName)")

authorName = nil
//print("Author is \(authorName!)")

if authorName != nil {
  print("Author is \(authorName!)")
} else {
  print("No author.")
}

if let unwrappedAuthorName = authorName {
  print("Author is \(unwrappedAuthorName)")
} else {
  print("No author.")
}

if let authorName = authorName {
  print("Author is \(authorName)")
} else {
  print("No author.")
}

if let authorName = authorName, let authorAge = authorAge {
  print("The author is \(authorName) who is \(authorAge) years old.")
} else {
  print("No author or no age.")
}

if let authorName = authorName, let authorAge = authorAge, authorAge >= 40 {
  print("The author is \(authorName) who is \(authorAge) years old.")
} else {
  print("No author or no age or age less than 40.")
}


// GUARD
func calculateNumberOfSides(shape: String) -> Int? {
  switch shape {
  case "Triangle":
    return 3
  case "Square":
    return 4
  case "Rectangle":
    return 4
  case "Pentagon":
    return 5
  case "Hexagon":
    return 6
  default:
    return nil
  }
}

func maybePrintSides(shape: String) {
  guard let sides = calculateNumberOfSides(shape: shape) else {
    print("I don't know the number of sides for \(shape).")
    return
  }
  
  print("A \(shape) has \(sides) sides.")
}


// NIL COALESCING
var optionalInt: Int? = 10
var mustHaveResult = optionalInt ?? 0

optionalInt = nil
mustHaveResult = optionalInt ?? 0
