/* Collection Types:
        Array
        Dictionary
        Set
 */

// make a variable array of Strings
var musicalModes = ["Ionian", "Dorian", "Phrygian", "Lydian", "Mixolydian"]
// what's at index 0?
let initialMode = musicalModes[0]
// change string at index 0
musicalModes[0] = "Aeolian"
// add a new element
musicalModes.append("Locrian")
//remove an element
let theRemovedElement = musicalModes.removeLast()
print(musicalModes)

// make a constant array of Int
let speedLimits = [15, 25, 30, 35, 40, 45, 50, 55, 60, 65]

// Type annotation for Array of Strings
var myStringArray: [String] = [] // empty array of Strings, must create container []

