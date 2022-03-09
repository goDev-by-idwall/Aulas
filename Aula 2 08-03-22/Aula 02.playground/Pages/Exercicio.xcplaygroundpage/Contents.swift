//: [Previous](@previous)

import UIKit

struct Stack {
    var array: [Int] = []
    
    mutating func push(_ value: Int) {
        array.append(value)
    }
    
    mutating func pop() -> Int? {
        return array.remove(at: self.array.count - 1)
    }
    
    func look() -> Any {
        guard let top = array.last else { return print("The stack is empty!") }
        
        return top
    }
}

var stack = Stack()

stack.push(10)
stack.push(35)
stack.push(12)
stack.pop()
stack.look()
//: [Next](@next)
