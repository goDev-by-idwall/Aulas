import UIKit

var notaMedia: Int = 4

switch notaMedia {
case 5:
    print("Você está abaixo da média")
case 6:
    print("Você está na média")
case 10:
    print("Parabéns, você tirou nota máxima")
default:
    print("Você não informou uma nota")
}

switch notaMedia {
case 0:
    print("Você precisa estudar")
// case com range de valores
case 1...3:
    print("Você está abaixo da média")
case 4:
    print("Você está abaixo da média - 4")
default:
    print("Você não informou uma nota")
}

enum State {
    case Success
    case Error
    case Loading
}

let state = State.Loading

switch state {
case .Success:
    print("Sucesso")
case .Error:
    print("Erro")
case .Loading:
    print("Carregando")
}

enum Strings: String {
    case titleButton = "Comprar"
    case titleLabel = "Falha, tente novamente"
}

let button = UIButton()
let label = UILabel()

button.setTitle(Strings.titleButton.rawValue, for: .normal)
label.text = "O texto referente"

enum Page: Int {
    case one = 1, two, three, four
    
    func getPage() -> Int {
        return self.rawValue
    }
}

var numberPage = Page.two

print(numberPage.getPage())

enum BankDeposit {
    case inValue(Int)
    case inCheck(Bool)
}

func makeDeposit(values: BankDeposit) {
    switch values {
    case .inValue(let value):
        print("O valor passado é: \(value)")
    case .inCheck(let inCheck):
        print("In Check: \(inCheck)")
    }
}

let deposit = BankDeposit.inValue(400)

makeDeposit(values: deposit)

var students = ["Felipe", "Valéria", "Isaac"]
let studentsDescending = students.sorted(by: >)

print(studentsDescending)

// lhs: Left Hand Side = Lado Esquerdo
// rhs: Right Hand Side = Lado Direito
students.sort { ( lhs: String, rhs: String ) -> Bool in
    lhs < rhs
}

print(students)

let array1 = [1 ,2 ,5, 6, 9]
let array2 = [10, 23, 45, 56, 91]
let flattenArray = array1 + array2

print(flattenArray)

// MARK: - MAP
var gradeStudents = [4, 5, 7, 9, 3]
var newGrades: [Int] = []

for grade in gradeStudents {
    let newGrade = grade + 1
    newGrades.append(newGrade)
}

print(gradeStudents)
print(newGrades)
//: NO MAP

gradeStudents = gradeStudents.map { res in
    return res + 1
}

print(gradeStudents)
//: UMA FORMA

gradeStudents = gradeStudents.map( { $0 + 1})

print(gradeStudents)
//: FORMA REDUZIDA

// MARK: - FILTER
var approvedGrades: [Int] = []

for grade in approvedGrades {
    if grade >= 6 {
        approvedGrades.append(grade)
    }
}

print(approvedGrades)
//: UMA FORMA

gradeStudents = gradeStudents.filter({ res in
    res >= 6
})

print(gradeStudents)
//: FORMA FILTER

gradeStudents = gradeStudents.filter { $0 >= 6 }

print(gradeStudents)
//: FORMA SIMPLIFICADA

// MARK: - REDUCE
var sum = 0
var grades = [4, 5, 6, 8, 10]

for grade in grades {
    sum += grade
}

print(sum)
//: UMA FORMA

sum = grades.reduce(0, { $0 + $1 })

print(sum)
//: FORMA REDUCE

// TODO: REALIZAR TAREFA DE PALINDROMO E SUBIR PARA O REPOSITÓRIO
let palindrome: String = "Ovo"

func testPalindrome(_ word: String) -> Bool {
    let reversedWord = String(word.reversed())
    print("\(word) - \(reversedWord)")
    
    if reversedWord == word {
        return true
    }
    
    return false
}

print("\(testPalindrome(palindrome))")
