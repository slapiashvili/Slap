//: [Previous](@previous)

import Foundation

/*
 required init
 */

enum AnimalType {
    case domestic
    case wild
}

class Animal {
    var age: Int
    var type: AnimalType
    
    init(age: Int, type: AnimalType) {
        print("🌕")
        self.age = age
        self.type = type
        print("🌕🌕")
    }
    
    required init() {
        age = 17
        type = .wild
    }
    
    func makeSound() {
        print(" main 🔊")
        // რაიმე default მქმედება რაც ყველა ცხოველს ახასიათებს
    }
}

class Dog: Animal {
    var ownerName: String
    
    init(ownerName: String, age: Int, type: AnimalType) {
        print("🔴")
        self.ownerName = ownerName
        super.init(age: age, type: type)
       
        print("🔴🔴")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("🐕 noise")
    }
}

Dog()

class HunterDogs: Dog {
    
    enum HuntingType {
        case bird
        case animal
    }
    
    let huntingType: HuntingType
    
    init(
        huntingType: HuntingType,
        ownerName: String,
        age: Int,
        type: AnimalType
    ) {
        print("🟢")
        self.huntingType = huntingType
        super.init(ownerName: ownerName, age: age, type: type)
        print("🟢🟢")
    }
}

let hunterDog = HunterDogs(huntingType: .bird, ownerName: "Lordi", age: 8, type: .domestic)


class Tiger: Animal {
    var continent: String?
    
    init(continent: String, age: Int, type: AnimalType) {
        self.continent = continent
        super.init(age: age, type: type)
    }
    
    override init(age: Int, type: AnimalType) {
        self.continent = nil
        super.init(age: age, type: .wild)
    }

    override func makeSound() {
        print("T sound")
    }
}


//: [Next](@next)


/*:
 >- convenience init() ის overriding არ შეიძლება
 >- stored properties ის overriding არ შეიძლება
 */

