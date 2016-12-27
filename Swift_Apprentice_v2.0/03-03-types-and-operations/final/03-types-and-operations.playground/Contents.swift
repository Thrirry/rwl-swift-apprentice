// CONVERTING TYPES
var integer: Int = 100
var decimal: Double = 12.5
//integer = decimal /* Cannot assign value of type 'Double' to type 'Int' */
integer = Int(decimal)

let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
//let totalCost: Double = hourlyRate * hoursWorked /* Binary operator '*' cannot be applied to operands of type 'Double' and 'Int' */
let totalCost: Double = hourlyRate * Double(hoursWorked)


// TYPE INFERENCE
let typeInferedInt = 42 /* Type = Int */
let typeInferedDouble = 3.14159 /* Type = Double */

let wantADouble = 3 /* Type = Int */
let actuallyDouble1 = Double(3)
let actuallyDouble2: Double = 3
let actuallyDouble3 = 3 as Double


// CHARACTERS
let characterA: Character = "a"
let characterDog: Character = "🐶"
let stringDog: String = "Dog"


// STRING CONCATENTATION
var message = "Hello" + " my name is "
let name = "Matt"
message += name

let exclamationMark: Character = "!"
message += String(exclamationMark)


// STRING INTERPOLATION
let messageInOne = "Hello my name is \(name)!"

let oneThird = 1.0 / 3.0
let oneThirdLongString = "One third is \(oneThird) as a decimal."



// TUPLES
let coordinates: (Int, Int) = (2, 3)
let coordinatesInferred = (2, 3) /* Type = (Int, Int) */
let coordinatesDoubles = (2.1, 3.5) /* Type = (Double, Double) */
let coordinatesMixed = (2.1, 3) /* Type = (Double, Int) */

let x1 = coordinates.0
let y1 = coordinates.1

let coordinatesNamed = (x: 2, y: 3)
let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

let coordinates3D = (x: 2, y: 3, z: 1)
let (x3, y3, z3) = coordinates3D
//let x3 = coordinates3D.x
//let y3 = coordinates3D.y
//let z3 = coordinates3D.z

let (x4, y4, _) = coordinates3D
