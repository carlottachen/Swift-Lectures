

/*  IF/ELSE Statements:
    - curly brackets are requried
    - parenthesis around condition is not required
        and not recommended unless there's multiple conditions
    - condition must be true or false
 */

var score = 100

if score > 10 {
    print("Score is bigger than 10")
} else {
    print("Score is less than 10")
}



/* SWITCH statements:
    - default statement is required in Swift switch statement
        because it must be exhaustive
    - there is no fallthrough, so no break statement is needed,
        stops when condition is found
 */

let volcanoExplosivityIndex: Int
volcanoExplosivityIndex = 9

switch volcanoExplosivityIndex {
case 0:
    print("Effusive")
case 1:
    print("Gentle")
    print("NOTE: expect.....")
case 2:
    print("Catastrophic!!")
case 3:
    print("Cataclysmic")
case 4, 5, 6:
    print("Can combine cases")
case 7...10:
    print("Can use range operator set a range")
    print("👹")
default:
    print("Nothing")
}

/*
    Loops
 
 */

var itemsToProcess = 4

while itemsToProcess > 0 {
    print("Processing...", itemsToProcess)
    itemsToProcess -= 1
}

repeat {
    print("Processing...", itemsToProcess)
    itemsToProcess -= 1
} while itemsToProcess > 0

/*
    - classic c-style for loop does not exist in Swift
    - looks more similarly to python for loop
 */

let randomWords = ["box", "card", "cup", "can", "phone", "Carlotta", "Peter"]

for word in randomWords {
    print(word)
}

for number in 1...10 {  // range operator can only ascend, no descending order
    print(number)
}

for number in 0..<10 {  // this range operator is non inclusive of max
    print(number)
}

for number in stride(from: 0, through: 20, by: 5) { // can take longer strides, 'through' is inclusive
    print(number)
}

for number in stride(from: 100, to: 50, by: -10){    // can do descending order with stride
    print(number)
}
