//
//  ViewController.swift
//  Desafio 01
//
//  Created by Felipe Brigagão de Almeida on 13/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var resultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "nathanColor")
        resultLabel.text = "R E S U L T A D O"
        valueLabel.text = ""
        messageLabel.text = ""
        
        resultView.layer.shadowPath = UIBezierPath(rect: resultView.bounds).cgPath
        resultView.layer.cornerRadius = 20
        resultView.layer.shadowRadius = 20
        resultView.layer.shadowOffset = CGSize(width: 2, height: 2)
        resultView.layer.shadowOpacity = 0.3
        
        calculateButton.configuration?.title = "C A L C U L A R"
        calculateButton.configuration?.baseForegroundColor = .black
        calculateButton.configuration?.baseBackgroundColor = .white
        
        weightTextField.keyboardType = .numberPad
        heightTextField.keyboardType = .numberPad
    }
        
    @IBAction func calculate(_ sender: UIButton) {
        let result = imcResult(height: Float(heightTextField.text ?? "") ?? 0, weight: Float(weightTextField.text ?? "") ?? 0)
        
        if validateFields() {
            valueLabel.text = String(format: "%.2f", result)
            messageLabel.text = "\(imcLabel(imc: result))"
        } else {
            let alert = UIAlertController(title: "Erro", message: "O peso ou a altura não foram preenchidas", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion:  nil)
        }
    }
}

extension ViewController {
    func imcResult(height: Float, weight: Float) -> Float {
        let result = weight / (height * height)
        
        return result
    }
    
    func imcLabel(imc: Float) -> String {
        var message: String = ""
        
        switch imc {
        case ...18.4:
            message = "Você está abaixo do peso ideal"
            valueLabel.textColor = UIColor(named: "warningWeight")
        case 18.5...24.9:
            message = "Você está no seu peso ideal"
            valueLabel.textColor = UIColor(named: "goodWeight")
        case 25.0...29.9:
            message = "Você está com sobrepeso"
            valueLabel.textColor = .yellow
        case 30...34.9:
            message = "Você está com obesidade GRAU 1"
            valueLabel.textColor = UIColor(named: "warningWeight")
        case 35...39.9:
            message = "Você está com obesidade GRAU 2"
            valueLabel.textColor = UIColor(named: "warningWeight")
        case 40.0...:
            message = "Você está com obesidade GRAU 3"
            valueLabel.textColor = .red
        default:
            message = "Erro, o calculo não foi executado."
            valueLabel.textColor = .black
        }
        
        return message
    }
    
    func validateFields() -> Bool {
        if weightTextField.text == "" || heightTextField.text == "" {
            return false
        }
        
        return true
    }
}
