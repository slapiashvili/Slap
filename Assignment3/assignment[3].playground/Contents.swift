import UIKit

//EXERCISE #1.1 done with swap.At method

var typesOfFish: [String] =
[
    "Salmon",
    "Tuna",
    "Trout",
    "Cod",
    "Bass",
    "Catfish",
    "Swordfish"
]

typesOfFish.swapAt(0, typesOfFish.count - 1)
print(typesOfFish)

//We came up with a string type array in which contains names of 7 different types of fish. After defining the array, we then swapped places of index 0 which is Salmon originally and last index, which can be written down with .count -1.

print("\n")

//EXERCISE #1.2 done with manual method

var primeNumbers: [Int] =
[
    2,
    3,
    5,
    7,
    11,
    13,
    17,
    19,
    23,
    29,
    31
]

let firstPrimeNumber = primeNumbers[0]
primeNumbers[0] = primeNumbers[primeNumbers.count - 1]
primeNumbers[primeNumbers.count - 1] = firstPrimeNumber

print (primeNumbers)

// we got a similar result here but without using the .swapAt command. First we define the value of index0 and then we have inde0 and last index swap places.

print("\n")

//EXERCISE #2

var finalists: [String] = [
    "John",
    "Liana",
    "Nick",
    "Adut",
    "Taylor",
    "Chris",
    "Maya",
    "Nijad",
    "Mona",
    "Lala",
    "Cara",
    "Devont",
    "Sally",
    "Micah"
]

let numParticipants = finalists.count
var numWinners: Int

if numParticipants % 2 == 0 {
    
    numWinners = numParticipants / 2
} else {
    numWinners = (numParticipants - 1) / 2
}

var winners = finalists[0..<numWinners]
print (winners)

//what we did here is define how to calculate the number of winners depending on odd or even amount of participants, then defined the winners as finalists starting from index0 up until number of winners -1.

print("\n")

//EXERCISE #3

let coolNumbers: [Int] =
[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
]


var coolEvens: [Int] = []
var coolOdds: [Int] = []

for element in coolNumbers {
    if element.isMultiple(of: 2) {
        coolEvens.append(element)
    } else {
        coolOdds.append(element)
    }
}

print(coolEvens)
print(coolOdds)

//what we did here was separate odd and even elements with for-in loop and add them one by one to separate arrays

print("\n")

//EXERCISE #4

var pricesOfComputers: [Double] = [
    888.999,
    789278994.98,
    934.09,
    24832.09,
    3437.099,
    2000.8,
    1083.09,
    2703.2749,
    999283.4
]

var maxPrice = pricesOfComputers[0]
for price in pricesOfComputers {
    if price > maxPrice {
        maxPrice = price
    }
}

print("Even the most expensive computer only costs $\(maxPrice) at our store.")

//what we did here was assume that the index0 is the greatest number. Then we used for-in loop to let it run through the array and see if the element is greater than first element. Eventually, it found the greatest value and replaced the maxPrice with that price.

print("\n")

//EXERCISE 5

var roomKeysReception: [Int] =
[
    8,
    4,
    9,
    9,
    0,
    2
]

var roomKeysTaken: [Int] = 
[
    1,
    0,
    9,
    2,
    3,
    7,
    0,
    1
]

var allKeys = roomKeysReception + roomKeysTaken


for i in 0..<allKeys.count {
    for j in 0..<allKeys.count {
        var temp = 0
        if allKeys[i] < allKeys[j] {
            temp = allKeys[i]
            allKeys[i] = allKeys[j]
            allKeys[j] = temp
            
        }
    }
}
print(allKeys)

//first we merged two separate arrays together, then we used the bubble sort method to sort them accordingly.

print("\n")

//EXERCISE 6

let learnedLetters: String = "ABCDCKKLMNOPQKLISVETS"
var uniqueLetters = Set<Character>(learnedLetters)

var CharactersCount = learnedLetters.count
var UniqueCharactersCount = uniqueLetters.count

if CharactersCount > UniqueCharactersCount {
    print("There are duplicate letters in your list.")
} else {
    print("All letters in your list are unique.")
}

//what we did here is create a set out of characters mentioned in an existing string. We know that the set must have gotten rid of any duplicates. If there amount of characters is more than in the set, it means there were some duplicates.

print("\n")

//EXERCISE 7

let studentIdNumbers: Set<Int> =
[
    23425215,
    32423426,
    545323457,
    34534519,
    345345940,
    34534523,
    3453234,
    2452432342,
    355522223,
    23423544,
    2342342345,
    5234235432
]

let teacherIdNumbers: Set<Int> = [
    23425652,
    324534634,
    346345342,
    4355552,
    64363463453,
    734653534,
    2452432342,
    6243523452,
    2652352
]

let unionIds = studentIdNumbers.union(teacherIdNumbers)
print(unionIds)

let intersectionIds = studentIdNumbers.intersection(teacherIdNumbers)
print (intersectionIds)

let differenceIds = studentIdNumbers.subtracting(teacherIdNumbers)
print (differenceIds)

// we printed union, intersection and difference between two separate sets of ID numbers.

print("\n")

//EXERCIS #8
let goodRockBands: Set<String> = 
[
    "Doors",
    "Pulp",
    "The Beatles",
    "Metallica",
    "Ramones",
    "Fleetwood Mac",
    "Pink Floyd",
    "Led Zeppelin",
    "Black Sabbath",
    "Iron Maiden",
    "Queen",
    "Deep Purple",
    "Dire Straits"
]

let britishBands: Set<String> =
[
    "Pulp",
    "The Beatles",
    "Pink Floyd",
    "Led Zeppelin",
    "Black Sabbath",
    "Iron Maiden",
    "Queen",
    "Deep Purple",
    "Dire Straits"
]


let isSubset = britishBands.isSubset(of:goodRockBands)

if isSubset {
    print("Great Britain has gifted us many great Rock bands.")
} else {
    print("Great Britain does not have that many good Rock bands.")
}

//we came to a VERY UNBIASED CONCLUSION that British bands are good bands since they are a subset of good bands.

print("\n")

//EXERCISE #9

let officeAddresses: [String] =
[
    "Goolivan Sq 8",
    "Gorky St 12",
    "Micah St 23",
    "Jeremiah St 9b D block",
    "Goolivan Sq 8",
    "Hundred Years Solitude St 65",
    "Random St 45a",
    "Jeremiah St 9b D block"
]

let uniqueOfficeAddresses = Set<String>(officeAddresses)

if uniqueOfficeAddresses.count < officeAddresses.count {
    print("Please note that the list includes duplicate addresses.")
} else {
    print("Please note that all addresses in the list are unique.")
}

//what we did is make a set for the array in which we know for sure there will be no duplicates and then we compared the amount of elements in each.

print("\n")

//EXERCISE 10

var films: [String: Double] = [
    "One Flew Over the Cuckoo's Nest": 8.7,
    "Eyes Wide Shut": 7.5,
    "Twelve Angry Men": 9.0,
    "Forest Gump": 8.8,
    "Memento": 8.4,
    "Three Billboards Outside Ebbing, Missouri": 8.1,
    "The Hunt": 8.3,
    "In the Mood for Love": 7.6,
    "Bashi-Achuki": 7.4
]

var totalRating: Double = 0.0
for rating in films.values {
    totalRating += rating
}

var averageRating = totalRating / Double(films.count)
print(averageRating)

//first we found out what the total rating of all movies added up would be, then found out the average by dividing that number by amount of ratings.
