import UIKit

//EXERCISE #1.1 - we came up with class Book that has two methods: one for marking the book as returned, another for marking the book as borrowed.
class Book {
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func markAsReturned() {
        if isBorrowed == true {
            isBorrowed = false
            print("\(title) by \(author)(\(bookID)) has been returned to the library.")
        } else {
            print("\(title) by \(author)(\(bookID)) is already in the library.")
        }
    }
    
    func markAsBorrowed() {
        if isBorrowed == false {
            isBorrowed = true
            print("\(title) by \(author)(\(bookID)) has been borrowed.")
        } else {
            print("\(title) by \(author)(\(bookID)) is currently not available.")
        }
    }
}

//EXERCISE #1.2 - here we have a class owner which has two methods, one for borrowing and another to allow the user to return the book.

class Owner {
    var ownerID: Int
    var name: String
    var borrowedBooks: [Book]?
    
    init(ownerID: Int, name: String, borrowedBooks: [Book]? = nil) {
        self.ownerID = ownerID
        self.name = name
        if let borrowedBooks = borrowedBooks {
            self.borrowedBooks = borrowedBooks
        }
    }
    
    func borrowBookFromLibrary(library: Library, bookID: Int) {
        library.borrowBook(ownerID: ownerID, bookID: bookID)
    }
    
    func returnBookToLibrary(library: Library, bookID: Int) {
        library.returnBook(ownerID: ownerID, bookID: bookID)
    }
}

//EXERCISE #1.3 - we have created a class Library which has multiple methods, like adding books to the library, letting users borrow and return books and etc.

class Library {
    var libraryBooks: [Book] = []
    var libraryOwners: [Owner] = []
    
    init(libraryBooks: [Book]? = nil, libraryOwners: [Owner]? = nil) {
        self.libraryBooks = libraryBooks ?? []
        self.libraryOwners = libraryOwners ?? []
    }
    
    func addBookToLibrary(book: Book) {
        libraryBooks.append(book)
        print("A book has just been added to the Library!")
    }
    
    func addOwnerToLibrary(owner: Owner) {
        libraryOwners.append(owner)
        print("A new customer has just joined the library!")
    }
    
    func showAvailableBooksInLibrary() -> [Book] {
        return libraryBooks.filter { !$0.isBorrowed }
    }
    
    func showBorrowedBooksInLibrary() -> [Book] {
        return libraryBooks.filter { $0.isBorrowed }
    }
    
    func findOwnerInLibrary(ownerID: Int) -> Owner? {
        for owner in libraryOwners {
            if owner.ownerID == ownerID {
                print("The user has been identified")
                return owner
            }
        }
        return nil
    }
    
    func showOwnersBooksInLibrary(ownerID: Int) {
        if let owner = libraryOwners.first(where: { $0.ownerID == ownerID }) {
            if let borrowedBooks = owner.borrowedBooks {
                if borrowedBooks.isEmpty {
                    print("\(owner.name) has no borrowed books.")
                } else {
                    print("\(owner.name)'s borrowed books can be accessed here:")
                    for book in borrowedBooks {
                        print("\(book.title) by \(book.author)")
                    }
                }
            } else {
                print("\(owner.name) has no borrowed books.")
            }
        } else {
            print("Owner could not be identified. Please double-check the owner ID.")
        }
    }
    
    func borrowBook(ownerID: Int, bookID: Int) {
        guard let owner = libraryOwners.first(where: { $0.ownerID == ownerID }) else {
            print("Owner could not be identified. Please double-check the owner ID.")
            return
        }
        
        guard let bookIndex = libraryBooks.firstIndex(where: { $0.bookID == bookID }) else {
            print("Book with mentioned ID could not be found in the library.")
            return
        }
        
        let book = libraryBooks[bookIndex]
        
        if book.isBorrowed {
            print("\(book.title) by \(book.author) is currently not available.")
        } else if let borrowedBooks = owner.borrowedBooks, borrowedBooks.contains(where: { $0.bookID == bookID }) {
            print("\(owner.name) already has this book.")
        } else {
            if owner.borrowedBooks == nil {
                owner.borrowedBooks = []
            }
            
            owner.borrowedBooks?.append(book)
            book.isBorrowed = true
            print("\(owner.name) has just successfully borrowed \(book.title) by \(book.author).")
        }
    }
    
    func returnBook(ownerID: Int, bookID: Int) {
        guard let owner = libraryOwners.first(where: { $0.ownerID == ownerID }) else {
            print("Owner could not be identified. Please double-check the owner ID.")
            return
        }
        
        guard let bookIndex = libraryBooks.firstIndex(where: { $0.bookID == bookID }) else {
            print("Book with mentioned ID could not be found in the library.")
            return
        }
        
        var book = libraryBooks[bookIndex]
        
        if book.isBorrowed {
            if var borrowedBooks = owner.borrowedBooks, let index = borrowedBooks.firstIndex(where: { $0.bookID == bookID }) {
                borrowedBooks.remove(at: index)
                book.isBorrowed = false
                print("\(owner.name) has returned \(book.title) by \(book.author) to the library.")
                libraryBooks[bookIndex] = book
            } else {
                print("\(owner.name) does not have this book.")
            }
        } else {
            print("\(book.title) by \(book.author) is already in the library.")
        }
    }
}


//EXERCISE #1.4
//create the library:
let programmingLibrary = Library()
//create owners:
let owner0 = Owner(ownerID: 1230, name: "Bill Gates")
let owner1 = Owner(ownerID: 1231, name: "Steve Jobs")
let owner2 = Owner(ownerID: 1232, name: "Mark Zuckerberg")
let owner3 = Owner(ownerID: 1233, name: "James Gosling")
//create some books:
let programmingBook0 = Book(bookID: 1000, title: "Python Crash Course", author: "Eric Matthes", isBorrowed: false)
let programmingBook1 = Book(bookID: 1001, title: "Effective Java", author: "Joshua Bloch", isBorrowed: false)
let programmingBook2 = Book(bookID: 1002, title: "You Don't Know JS", author: "Kyle Simpson", isBorrowed: false)
let programmingBook3 = Book(bookID: 1003, title: "iOS Programming for Beginners", author: "Craig Clayton", isBorrowed: false)
//add some books to the library:
programmingLibrary.addBookToLibrary(book: programmingBook0)
programmingLibrary.addBookToLibrary(book: programmingBook1)
programmingLibrary.addBookToLibrary(book: programmingBook2)
programmingLibrary.addBookToLibrary(book: programmingBook3)
//add owners to the library:
programmingLibrary.addOwnerToLibrary(owner: owner0)
programmingLibrary.addOwnerToLibrary(owner: owner1)
programmingLibrary.addOwnerToLibrary(owner: owner2)
programmingLibrary.addOwnerToLibrary(owner: owner3)

//have owners borrow and return some books:
owner0.borrowBookFromLibrary(library: programmingLibrary, bookID: 1002)
owner2.borrowBookFromLibrary(library: programmingLibrary, bookID: 1002)
owner0.returnBookToLibrary(library: programmingLibrary, bookID: 1002)
owner2.borrowBookFromLibrary(library: programmingLibrary, bookID: 1002)
owner1.borrowBookFromLibrary(library: programmingLibrary, bookID: 1001)
owner3.borrowBookFromLibrary(library: programmingLibrary, bookID: 1000)
owner3.returnBookToLibrary(library: programmingLibrary, bookID: 1000)

//display available books:
let availableBooks = programmingLibrary.showAvailableBooksInLibrary()
let borrowedBooks = programmingLibrary.showBorrowedBooksInLibrary()

for book in availableBooks {
    print("\(book.title) by \(book.author) is available.")
}

for book in borrowedBooks {
    print("\(book.title) by \(book.author) is not currently available.")
}

//books currently borrowed by Zuck:
programmingLibrary.showOwnersBooksInLibrary(ownerID: 1232)


//EXERCISE #2.1 - here we have created class Product

class Product {
    let productID: Int
    let name: String
    let price: Double
    
    init(productID: Int, name: String, price: Double) {
        self.productID = productID
        self.name = name
        self.price = price
    }
}

//EXERCISE #2.2 - created class Cart

class Cart {
    let cartID: Int
    var items: [Product]
    
    init(cartID: Int) {
        self.cartID = cartID
        self.items = []
    }
    
    func addProduct(product: Product) {
        items.append(product)
    }
    
    func removeProduct(productID: Int) {
        items.removeAll { $0.productID == productID }
    }
    
    func calculateTotalPrice() -> Double {
        return items.reduce(0.0) { $0 + $1.price }
    }
}

//EXERCISE #2.3 - created class User with three methods for adding products to the cart, removing them and checking out.

class User {
    let userID: Int
    let username: String
    var cart: Cart
    
    init(userID: Int, username: String) {
        self.userID = userID
        self.username = username
        self.cart = Cart(cartID: userID)
    }
    
    func addToCart(product: Product) {
        cart.addProduct(product: product)
    }
    
    func removeFromCart(productID: Int) {
        cart.removeProduct(productID: productID)
    }
    
    func checkout() -> Double {
        let totalPrice = cart.calculateTotalPrice()
        cart.items.removeAll()
        return totalPrice
    }
}

//EXERCISE #2.4 - we added some hair products to the store and chose two people with no hair to buy those products from the store. We have printed the outcome at last.

let hairbrush = Product(productID: 4001, name: "Hairbrush", price: 11.95)
let hairspray = Product(productID: 4002, name: "Hairspray", price: 10.40)
let hairgel = Product(productID: 4003, name: "Hair Gel", price: 7.49)
let shampoo = Product(productID: 4004, name: "Shampoo", price: 29.59)

let dwayneJohnson = User(userID: 101, username: "Dwayne Johnson")
let jeffBezos = User(userID: 102, username: "Jeff Bezos")

dwayneJohnson.addToCart(product: hairbrush)
dwayneJohnson.addToCart(product: hairspray)
jeffBezos.addToCart(product: hairgel)
jeffBezos.addToCart(product: shampoo)

print("\(dwayneJohnson.username)'s Cart Total: $\(dwayneJohnson.checkout())")
print("\(jeffBezos.username)'s Cart Total: $\(jeffBezos.checkout())")


