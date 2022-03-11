//: [Previous](@previous)

import UIKit

protocol Grade {
    func studentGrade()
}

protocol Class {
    func studentClass()
}

// Nos ajudam a organizar o código, adicionando funcionalidades em classes já existentes
class Student {
    var name: String?
    
    func getName() -> String {
        guard let name = name else { return "No name" }
        
        return name
    }
}

extension Student {
    func setName(name: String) {
        self.name = name
    }
}

extension Student: Grade {
    func studentGrade() {
        print(9.5)
    }
}

extension Student: Class {
    func studentClass() {
        print("Portuguese")
    }
}

var student = Student()

student.setName(name: "Felipe")

print(student.getName())

let str = "treinamento iOS"

extension String {
    func capitalizedFirst() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}

print(str.capitalizedFirst())

extension UIColor {
    static let surfaceGray = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
    static let lightBlue = UIColor(red: 0.32, green: 0.66, blue: 1.0, alpha: 1.0)
}

let color: [UIColor] = [.surfaceGray, .lightBlue]

extension UIImage {
    static let iconApple = UIImage(named: "appleIcon")
}

func icon() -> UIImage {
    guard let iamge: UIImage = .iconApple else { return UIImage(systemName: "airplane")! }
    
    return image
}

let image = icon()
//: [Next](@next)
