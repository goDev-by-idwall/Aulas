import UIKit

// Podemos herdar atributos e métodos da outras classes.
// Reference Types: É alocada um espaço de memória para que ele possa ser acessado, e caso seja criado uma instância de um objeto já instancidado, ambas serão apontadas para o mesmo local da memória.
class Person {
    var name: String
    var lastName: String
    var age: Int
    
    init(name: String, lastName: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }
    
    func welcome() {
        print("Seja bem vindo, \(name) \(lastName)")
    }

}

var person1 = Person(name: "Felipe", lastName: "Brigagão", age: 27)
var person2 = person1

person2.name = "Teste"

print(person1.welcome())
print(person2.welcome())
