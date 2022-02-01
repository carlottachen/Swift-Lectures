import UIKit
import Foundation

var closure : () -> Void = {
    print("do this")
}

closure() // call it like a function


var addS : (String) -> String = { aString in
    return "\(aString)s"
}

addS("Hey")


/// type alias
typealias NumberInAndOut = (Int) -> Int

var anotherClosure : NumberInAndOut = { (number) in
    return number * number
}

anotherClosure(5)
anotherClosure(2)

///
/// Struct creates its own initiallizers

struct Person {
    var firstName: String
    var lastName: String
    var age: Int
}

let steve = Person(firstName: "Steve", lastName: "Jobs", age: 65)
let peter = Person(firstName: "Peter", lastName: "Oh", age: 30)
let carlotta = Person(firstName: "Carlotta", lastName: "Chen", age: 29)
let elon = Person(firstName: "Elon", lastName: "Musk", age: 45)
let jeff = Person(firstName: "Jeff", lastName: "Bezos", age: 54)
let zuck = Person(firstName: "Mark", lastName: "Zuckerberg", age: 33)

// put these people in an array

let dudes = [steve, peter, carlotta, elon, jeff, zuck]

let firstNames = dudes.map { (person) -> String in
    person.firstName
}

let oldDudes = dudes.filter { (person) -> Bool in
    return person.age > 50
}

let normalDudes = dudes.filter { (person) -> Bool in
    //filter out names that start with "E"
    if let firstLetter = person.firstName.first {
        return firstLetter != "E"
    }
    return false // anyone with empty firstName, won't ever happen
}


///
///

func uploadImage(image: UIImage, completion: (success: Bool, imageURL: String?) -> Void) {
    // run code that uploads image to server and returns results via closure
    
    if !error {
        completion(success: true, imageURL: imageURL)
    } else {
        completion(success: false, imageURL: nil)
    }
}

uploadImage(image: image) { (success, aString) in
    
}

ImageController.uploadImage(image, completion: { (success, imageURL) -> Void in
    if success {
        print(imageURL)
    } else {
        print(":(")
    }
})


// count down timer that displays countdown

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func start(_ sender: Any) {
        let queue = DispatchQueue.global()
        queue.async {
            for i in 1...10 {
                // Anything to do with UI has to be done in main thread
                DispatchQueue.main.async {
                    self.label.text = "\(i)"
                }
                sleep(1)
            }
            DispatchQueue.main.async {
                self.label.text = "Done"
            }
        }
    }
    
    @IBAction func test(_ sender: Any) {
        print("Test")
    }
    
}
