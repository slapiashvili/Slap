import UIKit

var greeting = "Hello, playground"

class Animal {
    let name: String
    var age: Int
    
    init?(name: String, age: Int) {
        if age > 25 {
            self.age = age
            self.name = name
        } else {
            return nil
        }
    }
    
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
    
//    init(name: String) {
//        self.name = name
//        self.age = 0
//    }
//
//    convenience init(name: String) {
//        self.init(name: name, age: 100)!
//    }
}



var dog = Animal(name: "Jeka", age: 12)
var newDog = Animal(name: "Bob", age: 100)


class InfoForTransport {
    let information: String
    let buildYear: Int
    let startingPoint: String
    let endPoint: String
    
    init(
        information: String,
        buildYear: Int,
        startingPoint: String,
        endPoint: String
    ) {
        self.information = information
        self.buildYear = buildYear
        self.startingPoint = startingPoint
        self.endPoint = endPoint
    }
}
let testInfo = InfoForTransport(
    information: "Bus #22",
    buildYear: 2023,
    startingPoint: "point 0 0",
    endPoint: "point 1 1"
)

class Transport {
    
    let info: String
    let year: Int
    
    init(info: String, year: Int) {
        self.info = info
        self.year = year
    }
    
    init(infoObject: InfoForTransport) {
        info = infoObject.information
        year = infoObject.buildYear
    }
}

let bus = Transport(info: "Bus", year: 2023)
let newBus = Transport(infoObject: testInfo)

let newBus1 = Transport(info: testInfo.information, year: testInfo.buildYear)
