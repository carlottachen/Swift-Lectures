//putting 'final' in front of 'class' will not allow inheritance
class Appliance {   //superclass
    var manufacturer: String
    var model: String
    var voltage: Int
    var capacity: Int?
    
    // default initializer
    init() {
        self.manufacturer = "default manufacturer"
        self.model = "default model"
        self.voltage = 120
    }
    
    init(withVoltage: Int) {
        self.manufacturer = "default manufacturer"
        self.model = "default model"
        self.voltage = withVoltage
    }
    
    deinit {
        // perform cleanup code here..
        // release a file resource..
        // release a network resource..
        
    }
    
    func getDetails() -> String {
        var message = "This is the \(self.model) from \(self.manufacturer)."
        if self.voltage >= 220 {
            message += "This model is for European usage."
        }
        return message
    }
}

// Inheritance
class Toaster: Appliance {  //subclass
    var slices: Int
    
    override init() {
        self.slices = 2
        super.init()
    }
    
    func getToast() {
        print("Irradiating now...\n Manufactured by: \(self.manufacturer) \n Makes \(self.slices) slices at a time")
    }
}

// create new instance of Appliance
var kettle = Appliance()
// set variables
kettle.manufacturer = "Megappliance, Inc"
kettle.model = "TeaMaster 5000"
kettle.voltage = 120
print(kettle.getDetails())  //call method


var cafetiere = Appliance(withVoltage: 220) // Use initializer
cafetiere.manufacturer = "Megappliance EU"
cafetiere.model = "Electrotiere"
print(cafetiere.getDetails())


var toasty = Toaster()
toasty.manufacturer = "My Toast, Inc"
toasty.model = "Pro Toast 5000"
toasty.voltage = 170
toasty.slices = 4
print(toasty.getToast())

// Extensions allow us to add methods and properties to existing type without inheritance
// works with structs and enums
extension String {
    func removeSpaces() -> String {
        let filteredCharacters = self.filter { $0 != " " } // use every character that's not a space
        return String(filteredCharacters)
    }
}

let album = "Decks and drums and rock and roll"
print(album.removeSpaces())
print(album)


// Add computed properties
class Player: CustomStringConvertible {
    var name: String
    var livesRemaining: Int
    var enemiesDestroyed: Int
    var penalty: Int
    
    var description: String {
        return "Player: \(self.name) \n Score: \(self.score) \n Remaining Lives: \(self.livesRemaining)"
    }
    
    var score: Int {
        get {
            return (enemiesDestroyed * 1000) + (livesRemaining * 5000) - penalty
        }
        set {
            print("You passed in \(newValue), there isn't code here to actually change the score value")
        }
    }
    
    init(name: String) {
        self.name = name
        self.livesRemaining = 3
        self.enemiesDestroyed = 0
        self.penalty = 0
    }
}

let player1 = Player(name: "Carlotta") //create a new player and initialize with passed in name

player1.enemiesDestroyed = 20
player1.penalty = 300

print("The final score is \(player1.score)")
player1.score = 23230 // uses set method above
print("The final score is \(player1.score)")
print(player1)


// Define a protocol
protocol MyProtocol {
    //anything that adopts this protocol requires these methods and properties
    func showMessage()
    var name: String { get } // 'get' for read only, 'get set' for read and write
}

struct myStruct: MyProtocol {
    func showMessage() {
        print("Now conforming...")
    }
    var name: String {
        return "Carlotta"
    }
}
