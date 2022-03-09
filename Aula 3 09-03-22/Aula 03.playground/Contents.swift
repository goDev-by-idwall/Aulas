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
