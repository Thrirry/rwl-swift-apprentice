// Copyright 2016 Razeware Inc. (see LICENSE.txt for details)

/*:
 ## Dictionaries
 ### Question 1
 Which of the following statements are valid?
 */

//let dict1: [Int, Int] = [:] // Invalid: type should be [Int: Int] not [Int, Int]
//let dict2 = [:] // Invalid: type cannot be inferred
let dict3: [Int: Int] = [:] // Valid

//: Given
let dict4 = ["One": 1, "Two": 2, "Three": 3]
//: Which of the following are valid:

//dict4[1] // Invalid: key should be String, not Int
dict4["One"] // Valid
//dict4["Zero"] = 0 // Invalid: dict4 is a constant
//dict4[0] = "Zero" // Invalid: key should be a String and value should be an Int - and dict4 is a constant anyway

//: Given
var dict5 = ["NY": "New York", "CA": "California"]

//: Which of the following are valid?
dict5["NY"]  // Valid
dict5["WA"] = "Washington" // Valid
dict5["CA"] = nil // Valid


/*:
 ### Question 2
 Write a function that swaps the values of two keys in a dictionary. 
 This is the signature of the function:
```
 func swappingValuesForKeys(_ key1: String, _ key2: String, in dictionary: [String: Int]) -> [String: Int]
```
*/

func swappingValuesForKeys(_ key1: String, _ key2: String, in dictionary: [String: Int]) -> [String: Int] {
  var newDictionary = dictionary
  let oldValue = newDictionary[key1]
  newDictionary[key1] = newDictionary[key2]
  newDictionary[key2] = oldValue
  return newDictionary
}

/*:
 ### Question 3
 Given a dictionary with 2-letter state codes as keys and the full state name as values, write a function that prints all the states whose name is longer than 8 characters. For example, for this dictionary ["NY": "New York", "CA": "California"] the output would be "California". 
 */

func printLongStateNames(in dictionary: [String: String]) {
  for (_, value) in dictionary {
    if value.characters.count > 8 {
      print(value)
    }
  }
}


/*:
 ### Question 4
 Write a function that combines two dictionaries into one. If a certain key appears in both dictionaries, ignore the pair from the first dictionary. 
 This is the signature of the function:
```
func combine(dict1: [String: String], with dict2: [String: String]) -> [String: String]
```
*/

func merging(_ dict1: [String: String], with dict2: [String: String]) -> [String: String] {
  var newDictionary = dict1
  for (key, value) in dict2 {
    newDictionary[key] = value
  }
  return newDictionary
}


/*:
 ### Question 5
 Declare a function `letterStats` that calculates which characters occur in a string, as well as how often each of these characters occur. 
 Return the result as a dictionary. This is the function signature:
 ```
  func occurrencesOfCharacters(in text: String) -> [Character: Int]
 ```
 */
func occurrencesOfCharacters(in text: String) -> [Character: Int] {
  var occurrences: [Character: Int] = [:]
  for character in text.characters {
    if let count = occurrences[character] {
      occurrences[character] = count + 1
    } else {
      occurrences[character] = 1
    }
  }
  return occurrences
}

/*:
 ### Question 6
 Write a function that returns true if all of the values of a dictionary [String: Int] are unique.  Use a dictionary to test uniqueness.
 This is the function signature:
```
 func isInvertible(_ dictionary: [String: Int]) -> Bool
```
 */
func isInvertible(_ dictionary: [String: Int]) -> Bool {
  var isValuePresent: [Int: Bool] = [:]
  for value in dictionary.values {
    if isValuePresent[value] != nil {
      return false  // duplicate value detected
    }
    isValuePresent[value] = true
  }
  return true
}

/*:
 ### Question 7
 Write an `invert` function that takes a dictionary [String: Int] and creates a new inverted dictionary [Int: String] where the values are the keys and the keys are the values. Note that for this function to work properly, the dictionary must be invertible.  You can check this by using the function you created above to do ```precondition(isInvertible(input), "this dictionary can't be inverted")``` at the beginning of your function body.  Your program will halt if this precondition is not met.
 This is the function signature:
 ```
 func invert(_ input: [String: Int]) -> [Int: String]
 ```
 
```
 func invert(_ input: [String: Int]) -> [Int: String]
```
 */

func invert(_ input: [String: Int]) -> [Int: String] {
  precondition(isInvertible(input), "this dictionary can't be inverted")
  var output: [Int: String] = [:]
    
  for (key, value) in input {
    output[value] = key
  }
  return output
}
  
let testInvert = ["Eggs": 1000, "Bacon": 1001]
invert(testInvert)

/*:
 ### Question 8
 Write a function that takes a dictionary [String: Int16] and prints the keys and values
 alphabetically sorted by keys.
 This is the function signature:

 ```
 func printSortedKeysAndValues(_ input: [String: Int16])
 ```
 */

let testSort: [String: Int16] = ["Zebra": 3, "Aligator": 2, "Baboon": 3, "Cat": 10, "Dog": 8, "Elephant": 20, "Finch": 2, "Giraffe": 30]

func printSortedKeysAndValues(_ input: [String: Int16]) {
  for k in Array(input.keys).sorted() {
    print("\(k): \(input[k]!)")
  }
}

printSortedKeysAndValues(testSort)

/*:
 ### Question 9. 
 Given the dictionary:
 */
var nameTitleLookup: [String: String?] = ["Mary": "Engineer", "Patrick": "Intern", "Ray": "Hacker"]
/*:
Set the value of the key "Patrick" to `nil` and completely remove the key and value for "Ray".
 */
nameTitleLookup.updateValue(nil, forKey: "Patrick")
nameTitleLookup.removeValue(forKey: "Ray")
nameTitleLookup["Ray"] = nil  // The same as removeValue

nameTitleLookup

