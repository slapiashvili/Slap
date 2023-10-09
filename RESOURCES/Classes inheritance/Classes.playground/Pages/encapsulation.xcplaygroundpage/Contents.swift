//: [Previous](@previous)

import Foundation

/*:
 >- Access control ჯერ არ გაგვივლია, არ იდარდოთ
 */

class BankAccount {
        
    private var balance: Double = 0.0
    
    func deposit(amount: Double) {
        if amount > 0 {
            balance += amount
        }
    }
    
    func withdraw(amount: Double) {
        if amount > 0 && amount <= balance {
            balance -= amount
        }
    }
    
    func check() {
        print(balance)
    }
}

let myAccount = BankAccount()

myAccount.deposit(amount: 1000)
myAccount.withdraw(amount: 500)
myAccount.check()
