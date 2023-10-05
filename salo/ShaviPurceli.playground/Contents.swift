import UIKit

//FOR-IN LOOP
//three ways to use the for-in loop
//1 - regular range of numbers

for number in 1...10 {
    print(number)
}

//2 - an array

var fruits = ["Apples", "Bananas", "Pears", "Blueberries"]
for fruit in fruits {
    print("I love \(fruit)")
}

//3 - class getting a gold star

var kids = ["Jason", "Mia", "Sally"]
for kid in kids {
    print("\(kid) gets a gold star!")
}

//4 add 7 to each and  and divide by 2

var scores: [Double] = [45, 123, 45, 54, 7, 2, 6]
for score in scores {
    var newscores = (score + 7)/2
    print (newscores)
}

//WHILE LOOP
//1 - we are counting apples in a box, each box can only fit 100 apples. each time we put in 16. when they are close to being overfilled, we stop
var appleCount = 1
while appleCount >= 1 && appleCount <= 100 {
    if appleCount == 1 {
        print("There is one apple in the box")
    }else{
        print("There are \(appleCount) apples in the box")
    }
    appleCount += 16
}

//2 while loop that is making sure that the coffee is brewing or it stops brewing when we run out of coffeebeans
var coffeeBeans = 20
while coffeeBeans >= 10 {
    if coffeeBeans >= 10 {
        print("Wait a bit, brewing some fresh coffee for you")
    }else{
        print("Not enough coffee beans in the machine. Please refill")
    }
    coffeeBeans -= 10
}

print("The coffee machine is out of beans")

//3 a while loop with a break: needs 10 coins to work, stop displaying the message after 10 coins

var coinCount = 1

while coinCount <= 10 {
    print("there are not enough coins in the machine")
    coinCount += 5
    
    if coinCount > 10 {
        break
    }
}

//REPEAT WHILE LOOP

var machineCapacity = 1000
var beginningCoins = 0

repeat {
    print("Adding coins...")
    beginningCoins += 500
} while machineCapacity >= beginningCoins

//NESTED LOOP

for _ in 1...3 {
    for _ in 1...3 {
        print("okay alright", terminator: "")
    }
    print("")
}


//CLOSURES
//make a closure to sort the numbers

let myFavNumbers = [1, 4, 5, 2, 8, 10, 15, 9, 7, 3]
let sortedFavNumbers = myFavNumbers.sorted { (a, b) -> Bool in
    a < b
}

print(sortedFavNumbers)

//make a closure to sort the Strings according to word lenght

let myFavWords = ["Sally", "Banana", "Hello", "Plushie"]
let sortedFavWords = myFavWords.sorted { (a, b) -> Bool in
    a.count < b.count
}

print(sortedFavWords)

// another closure to get rid of some odd numbers

let someNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let eliminatedOdds = someNumbers.filter { (number) -> Bool in
    number % 2 == 0}
print(eliminatedOdds)


//function
func greetAgain(person: String) -> String {
    return "Hello again," + person + "!"
}
print(greetAgain(person: "Anna"))


//lets use .filter

let studentNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let evenstudentNumbers = studentNumbers.filter { $0 % 2 == 0}
print(evenstudentNumbers)


//lets use .map
let studentsthere = [1, 3, 6, 30, 34, 692]
let studentsthereTrippled = studentsthere.map { $0 * 3 }
print(studentsthereTrippled)



