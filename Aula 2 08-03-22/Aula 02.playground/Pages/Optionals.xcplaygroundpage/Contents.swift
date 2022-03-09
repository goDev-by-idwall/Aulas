import UIKit

// Optionals são setadas por padrão como nil
var message: String?

// Podemos tratar de diversas formas, utilizando um valor substituto caso ele esteja vazio com ??
print("Mensagem: \(message ?? "Sem Mensagem")")

// A utilização do if let (conhecido como safe-unwrapping) auxilia a tratar Optionals de forma segura.
message = "Agora eu tenho uma mensagem"

if let message = message {
    print("Mensagem: \(message)")
}
