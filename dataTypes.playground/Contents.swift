
/*
    Enumerations : define your own types, limit options
 
 */

enum MediaType {
    case book
    case movie
    case music
    case genre
}

var itemType: MediaType // set to enum
itemType = MediaType.book   // can only select from enum
itemType = .genre   // don't have to use enum label afterwards
itemType = .music

itemType = .book
switch itemType {
case .movie:
    print("watching movie")
case .music:
    print("i like edm")
case .book:
    print("reading a book")
case .genre:
    print("this is horror")
}   // don't need default because this is exhaustive for enum created



// raw values
enum BottleSize: String {
    case half = "37.5 cl"
    case magnum = "1.5 litres"
    case balthazar = "12 litres"
}
var myBottle: BottleSize = .magnum
print("value: \(myBottle), raw value: \(myBottle.rawValue)")



// associated values
enum CourseInfo {
    case science(String)
    case math(Int)
    case lunch(Double)
}
var firstClass: CourseInfo = .science("Chemistry")
var secondClass: CourseInfo = .lunch(10.50)
var lastClass: CourseInfo = .math(2)

switch firstClass {
case .science(let sciField):
    print("I am taking \(sciField)")
case .math(let period):
    print("I have math \(period) period")
case .lunch(let time):
    print("I have lunch at \(time)")
}


/*
    Structs : data that belongs together
    - variables inside a struct are called a property
    - functions inside a struct are called a method
 
 */

struct Movie {
    var title: String
    var director: String
    var releaseYear: Int
    
    func summary() -> String {
        return "\(title) is directed by \(director) and release in \(releaseYear)."
    }
}

var first = Movie(title: "Arrival", director: "Denis Villeneuve", releaseYear: 2016)

var second = Movie(title: "Sing Street", director: "John Carney", releaseYear: 2017)

print(first.director)
second.releaseYear = 2016
print(second.releaseYear)

print(first.summary())
print(second.summary())


/*
    Dictionaries: in other languages called maps, symbol table, etc. They have key value pairs (key and values)
    - keys must be unique
 */

// create dictionary
var airlines = ["SWA" : "Southwest Airlines", "BAW": "British Airways", "BHA": "Buddha Air"]

// to declare without values:
var periodicElements: [String: String]

// need to unwrap optional!!
if let result = airlines["SWA"]{
    print(result)
} else {
    print("No match found")
}

// add or change or remove
airlines["DVA"] = "Discovery Airlines"  // add because DVA doesn't exist
airlines["BAW"] = "Bahama Airlines" // change because BAW exists
airlines["BHA"] = nil   // removes entire key value pair
print(airlines)

// iterate dictionary using for loop
for entry in airlines {
    print(entry)
}

// use tuple to access airlines dictionary
for (key, value) in airlines {
    print("These are the keys: \(key)")
    print("These are the values: \(value)")
}

// tuples       //
let cameraType = "Canon"
let photoMode = true
var shutterSpeed = 60

var basicTuple = (cameraType, photoMode, shutterSpeed, "String Literal!", 2323)

// returning tuple
func randomAlbum () -> (albumTitle: String, length: Int) {
    let title = "My Song"
    let duration = 25
    return (title, duration)
}
print(randomAlbum())
print(randomAlbum().0)  //can access like an array using index
print(randomAlbum().length) // use name assigned above

let (one, two) = randomAlbum()  // can access return like this also
print(one)
print(two)



