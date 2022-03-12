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
        if emailTextField.text == "" || passwordTextField.text == "" {
            present(createErrorAlert, animated: true, completion: nil)
        } else if emailValidation(email: emailTextField.text!) {
            present(createSuccessAlert, animated: true, completion: nil)
        } else {
            present(createWrongEmailAlert, animated: true, completion: nil)
        }
    }
    
    lazy var createErrorAlert: UIAlertController = {
        let alert = UIAlertController(title: "Erro", message: "O email ou a senha estão vazios.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { action in
            print("Confirmar foi tocado")
        }))
        alert.view.backgroundColor = .darkGray
        alert.view.tintColor = UIColor(named: "AccentColor")
        
        return alert
    }()
    
    lazy var createSuccessAlert: UIAlertController = {
        let alert = UIAlertController(title: "Sucesso", message: "Conectado com sucesso!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { action in
            print("Confirmar foi tocado")
        }))
        alert.view.backgroundColor = .darkGray
        alert.view.tintColor = UIColor(named: "AccentColor")
        
        return alert
    }()
    
    lazy var createWrongEmailAlert: UIAlertController = {
        let alert = UIAlertController(title: "Erro", message: "O email foi digitado incorretamente", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { action in
            print("Confirmar foi tocado")
        }))
        alert.view.backgroundColor = .darkGray
        alert.view.tintColor = UIColor(named: "AccentColor")
        
        return alert
    }()

}

extension HomeController {
    func emailValidation(email: String) -> Bool {
        if email.contains("@") && email.contains(".com") {
            return true
        }
        
        return false
    }
}
