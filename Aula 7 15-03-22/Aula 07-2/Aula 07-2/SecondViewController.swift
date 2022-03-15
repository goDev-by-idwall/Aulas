//
//  SecondViewController.swift
//  Aula 07-2
//
//  Created by Felipe Brigagão de Almeida on 15/03/22.
//

import UIKit

class SecondViewController: UIViewController {
    private var property: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let property = property {
            print("Estou acessando o valor da secondViewController: \(property.name)")
        }
    }
    
    func setData(data: Data) {
        self.property = data
    }

}
