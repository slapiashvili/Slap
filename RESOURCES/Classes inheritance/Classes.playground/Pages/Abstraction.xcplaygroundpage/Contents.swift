//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

class Shape {

    func area() -> Double {
        fatalError("გადასაფარია subclass ში")
    }
    
    func perimeter() -> Double {
        fatalError("გადასაფარია subclass ში")
    }
}

class Circle: Shape {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    override func area() -> Double {
        Double.pi * radius * radius
    }
    
    override func perimeter() -> Double {
        2 * Double.pi * radius
    }
}

class Rectangle: Shape {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    override func area() -> Double {
        width * height
    }
    
    override func perimeter() -> Double {
        2 * (width + height)
    }
}

func printShapeInfo(shape: Shape) {
    print("ფართობი: \(shape.area())")
    print("პერიმეტრი: \(shape.perimeter())")
}

let testCircle = Circle(radius: 5.0)
let testRectangle = Rectangle(width: 4.0, height: 6.0)

print("წრე")
printShapeInfo(shape: testCircle)

print("\nმართკუთხედი:")
printShapeInfo(shape: testRectangle)

//: [Next](@next)
