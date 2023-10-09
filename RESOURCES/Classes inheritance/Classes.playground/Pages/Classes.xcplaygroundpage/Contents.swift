//: [Previous](@previous)

import Foundation

class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        
    }
}

var dog: Animal? = Animal(name: "Jeka")
var myDog: Animal? = dog
var mySistersDog: Animal? = dog

mySistersDog?.name = "Bob"
myDog?.name

myDog = nil
mySistersDog = nil
dog = nil


//: [Next](@next)
