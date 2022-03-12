//
//  ViewController.swift
//  Aula 05
//
//  Created by Felipe Brigagão de Almeida on 11/03/22.
//

import UIKit

class HomeController: UIViewController {
    // MARK: - PROPERTIES
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var authentitacionButton: UIButton!
    
    // MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func authenticate(_ sender: UIButton) {
        // TODO: - VERIFICAR SE OS DADOS ESTÃO VALIDOS, E CRAIR UM ALERTA DE SUCESSO, CASO CONTRÁRIO APRESENTAR UM ALERTA DE FALHA
        
        let alert = UIAlertController(title: "Erro", message: "O email ou a senha estão vazios.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { action in
            print("Confirmar foi tocado")
        }))
        alert.view.backgroundColor = .darkGray
        alert.view.tintColor = UIColor(named: "AccentColor")
        
        present(alert, animated: true, completion: nil)
        
        if let pass = passwordTextField.text, let email = emailTextField.text {
            print("O email é: \(email)")
            print("A senha é: \(pass)")
        }
    }
}

extension HomeController {
    // TODO: - VERIFICAR SE O EMAIL É VÁLIDO
    
}
