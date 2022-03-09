//: [Previous](@previous)

import UIKit

func myCar() {
    print("Meu Carro")
}

func myCar(name: String) {
    print("Meu Carro é: \(name)")
}

func myname(name first: String) {
    print("Meu nome é: \(first)")
}

func myAge(_ age: Int) {
    print("Minha idade é: \(age)")
}

myCar()
myCar(name: "Fiat Stilo")
myname(name: "Felipe")
myAge(27)

// Função com retorno
typealias FullName = String

func getName(name: String) -> FullName {
    name
}

print(getName(name: "Felipe"))

func getPerson(name: String, lastName: String, age: Int) -> (String, String, Int) {
    return (name, lastName, age)
}

let person = getPerson(name: "Felipe", lastName: "Brigagão", age: 27)

print(person)

func makeBuy(value: Int, onCompletion: (Int) -> Void) {
    onCompletion(value)
}

makeBuy(value: 35) { res in
    print("res: \(res)")
}
//: [Next](@next)
