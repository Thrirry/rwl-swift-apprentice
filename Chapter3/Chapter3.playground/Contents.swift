//: Playground - noun: a place where people can play

/*
 
 
 TYPE INFERENCE

 Mini-exercises
 1. Create a constant called age1 and set it equal to 42.Create a constant called age2 and set it equal to 21. Check using Option-click that the type for both has been inferred correctly as Int.
 
 */
let age1 = 42 //Int inferred
let age2 = 21 //Int inferred


/*
 
2. Create a constant called avg1 and set it equal to the average of age1 and age2 using the naïve operation (age1 + age2) / 2. Use Option-click to check the type and check the result of avg1. Why is it wrong?
 
 */

let avg1 = (Double(age1) + Double(age2))/2 //Int double

/*
 
 3. Correct the mistake in the above exercise by casting age1 and age2 to Double in the formula. Use Option-click to check the type and check the result of avg1. Why is it now correct?
 
 */

// It is correct because I did explicit to swift that the age 1 ange age2 was double


/*
 
 STRINGS
 
 
 Mini-exercises
 1. Create a string constant called firstName and initialize it to your first name. Also create a string constant called lastName and initialize it to your last name. 
 */
let firstName = "Hoff"
let lastName = "Silva"

/*
 2. Create a string constant called fullName by adding the firstName and lastName constants together, separated by a space.
 */
let fullName = firstName + " " + lastName


/*
 3. Using interpolation, create a string constant called myDetails that uses the fullName constant to create a string introducing yourself. For example, my string would read: "Hello, my name is Matt Galloway.".
 */
let myDetails = "Hello, my name is \(fullName)"

/*
 
 TUPLAS
 
 Mini-exercises
 1. Declare a constant tuple that contains three Int values followed by a Double. Use this to represent a date (month, day, year) followed by an average temperature for that date.
 */
let threeIntAndOneDouble = (month: 0, day: 0, year: 0, averageTemp: 0.0)

/*
 2. Change the tuple to name the constituentComponents. Give them names related to the data that they contain: month, day, year and averageTemperature.
*/

let constituentComponents = threeIntAndOneDouble

/*
 3. In one line,read the day and averageTemperature values into two constants. You’ll need to employ the underscore to ignore the month and year.
*/

//let (day, _, _, averageTemp) = constituentComponents


/*
 4. Up until now,you’ve only seen constant tuples. But you can create variable tuples, too. Change the tuple you created in the exercises above to a variable by using var instead of let. Now change the average temperature to a new value.
 */
var (day, _, _, averageTemp) = constituentComponents
averageTemp = 10

/*
 
 CHALLENGES!
 
 */

/*
 1. Create a constant called coordinates and assign a tuple containing two and three to it.
 */
let coordinates = (2, 3)

/*
 2. Create a constant called named coordinate with a row and column component.
 */
let coordinate = (row: 0, column: 0)

/*
 3. Which of the following are valid statements?
 let character: Character = "Dog" - Invalid statement because a Character supports only one character. "D" or "o" or "g"
 let character: Character = "🐶" - Valid statement
 let string: String = "Dog" - Valid statement
 let string: String = "🐶" - Valid statement
 */

/*
 4. Is this valid code?
 let tuple = (day: 15, month: 8, year: 2015)
 let day = tuple.Day
 No, is not because the swift is a case sensitive language, and the constant tuple dont have the assign called Day.
 */

/*
 5. What is wrong with the following code?
 let name = "Matt"
 name += " Galloway"
 A constant can not be changed, to do it you need change let to var.
 */

/*
 6. What is the type of the constant called value?
 let tuple = (100, 1.5, 10)
 let value = tuple.1
 
 value is Double.
 */
/*
 7. What is the value of the constant called month?
 let tuple = (day: 15, month: 8, year: 2015)
 let month = tuple.month
 month has the value 8
 */
/*
 8. What is the value of the constant called summary?
 let number = 10
 let multiplier = 5
 let summary = "\(number) multiplied by \(multiplier) equals \(number *
 multiplier)"
 The value of summary is "10 multiplied by 5 equals 50"
 */
/*
 9. What is the sum of a, b minus c?
 let a = 4
 let b: Int32 = 100
 let c: UInt8 = 12
 let sum = (a + b) - c
 sum equals 92
 */
/*
 10. What is the numeric difference between Double.pi and Float.pi?
 The number of characters after comma, the Double has more precision than Float.
 */



