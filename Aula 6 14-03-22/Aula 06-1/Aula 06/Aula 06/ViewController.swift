//
//  ViewController.swift
//  Aula 06
//
//  Created by Felipe Brigagão de Almeida on 14/03/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - PROPERTIES
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
    }

    func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Celula tocada: \(indexPath.row)")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "Titulo da Célula"
        cell.detailTextLabel?.text = "Lorem ipsum is simply dummy text of the printing and typesetting industry."
        cell.imageView?.image = UIImage(systemName: "globe.americas")
        cell.imageView?.tintColor = .black
        
        return cell
    }
}
