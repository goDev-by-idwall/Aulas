//: [Previous](@previous)

import UIKit

// Não podemos utilzar herança nem de classes quanto de outras estruturas.
// Value Types: Cada instância tem uma alocação própria na memória.
// Não necessita de um construtor explicito.
struct Person {
    var name: String
    var lastName: String
    var age: Int
    
    func welcome() {
        print("Seja bem vindo, \(name) \(lastName)")
    }
}

var person1 = Person(name: "Felipe", lastName: "Brigagão", age: 27)
var person2 = person1

person2.name = "Teste"

print(person1.welcome())
print(person2.welcome())

//: [Next](@next)
