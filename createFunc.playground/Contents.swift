
/*
    - Syntax for methods and functions are the exact same
 */

func showMessage() {
    print("The function has been called.")
}
showMessage()

// add parameter

func showInt(number: Int, name: String) {
    // passed in parameters are constants, but can copy into new variable
    var num = number + number
    num = num - 2
    print("This is \(num) for \(name)")
}
showInt(number: 7, name: "Carlotta")  // must show each label when invoking

// return values

func basicFunction() -> String {    // String is what will be returned
    let str = "This is a simple function."
    print(str)
    return str
}
let result = basicFunction()    // result will be type inferred as a string
print(result)

func voidFunction(number: Int) -> Void {    // can use 'Void' to explicity return nothing
    // code
}

// takes an int and returns a bool by using (Int) -> Bool
func getBoolFunc(number: Int) -> Bool{
    // code
    return true
}
let boolResult = getBoolFunc(number: 3)
print(boolResult)

// take two doubles and return array of strings (Double, Double) -> [String]
func getStrArr(number: Double, number2: Double) -> [String]{
    // code
    return ["one", "two"]
}
let strArr = getStrArr(number: 1.2, number2: 2.5)
print(strArr)

// passing in stuff
func giveNum(number: Int){
    print("Your lucky number is \(number)")
}
giveNum(number: 3)

func showName(_ name: String){
    print("Hi, my name is \(name)")
}
showName("Carlotta")    // put _ to not use label in invoke statement

// use parameter nicknames
func calc(between firstAmount: Int, and secondAmount: Int) -> Int {
    return firstAmount - secondAmount   // use firstAmount/secondAmount inside function
}
let calcResult = calc(between: 2342, and: 333)  //use between/and when invoking
print("The diff is \(calcResult)")




