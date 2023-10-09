//: [Previous](@previous)

import Foundation

class Animal {
    func makeSound() {
       // ყველა
    }
}

class Dog: Animal {
    override func makeSound() {
        // ძაღლის
    }
}

class Cat: Animal {
    override func makeSound() {
        // კატის
    }
}

func playSoundOf(_ animal: Animal) {
    animal.makeSound()
}






//: [Next](@next)
