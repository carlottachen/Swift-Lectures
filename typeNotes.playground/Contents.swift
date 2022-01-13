/* Notes:
    - Swift is type safe!
    - Shouldn't end statements with semicolons;
    - Type inferred
 */

var playerName = "Carlotta" // string
var age = 29    // int
var temperature = 78.9  // double (default floating point in swift)
var activeMembership = true // boolean
type(of: activeMembership)   // to get type of a variable

// initialize without value
var bonusScore: Int //[: Int] this part is the type annotation
var environmentName: String // Note that Swift does not initialize to default values (ex. 0)
var levelCompleted: Bool
var progressPerecentage: Double = 10.5  // this is allowed but pointless

var player = "Brownie"  // make a variable
player = "Peter"    // can change it

let player2 = "Carlotta"    // using 'let' makes a constant
// player2 = "Peter"   //this will throw an error

func simpleFunction(){
    let message = "Should this be a variable or constant?"
    // always use 'let' for anything that will not change
    
    let currentMonth: String    // first create a constant label
    currentMonth = "December"   // okay to initialize value later on for const
    // currentMonth = "March"  // cannot change it since it is a constant
    
    print(message)
    print(currentMonth)
}
simpleFunction()

// Operator example
let a = 5.0
let b = 2.0
let myResult = a / b    // a and b must be same type
type(of: myResult)

var score = 1   // this is an int
var highScore = 100.0   // this is a double
highScore = Double(score)   // explicit type conversion is allowed
type(of: score) // score is still an int
print(score)
print(highScore)

// Syntax conversion
let myFloat = Float(score)  // make float from int
type(of: myFloat)
let myString = String(score)    // make string from float
type(of: myString)
let myDouble = Double(score)    // make double from string
type(of: myDouble)
let myInt = Int(highScore)  // make int from float
type(of: myInt)

var firstName: String
var middleName: String? // ? means optional variable, will contain String or Nothing at all
var lastName: String
var myAge: Int? // will contain integer or nothing at all
myAge = 29

// myAge = myAge + 50 // must unwrap first because myAge is an optional

// Unwrap option 1
if myAge != nil{
    // this is "forced unwrapping" and should only be done if we know there is a value
    // which is why we check if it is nil first
    var unwrappedMyAge = myAge!
    unwrappedMyAge = unwrappedMyAge + 50
    print(unwrappedMyAge)
}else{
    // do nothing
}

// Unwrap option 2 that is more concise
if let unwrapAge = myAge{
    //will check if myAge is nil, then make new const unwrapAge if there is a value
    print(unwrapAge)
}

myAge = nil // can remove value for optionals (nil = no value)




