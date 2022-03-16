//
//  ViewController.swift
//  Desafio 2
//
//  Created by Felipe Brigagão de Almeida on 15/03/22.
//

import UIKit

class ViewController: UIViewController {
    var products: [Product] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Products View"
        
        delegates()
        registerCell()
        productsInfo()
    }
    
    func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerCell() {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailViewController" {
            if let detailViewController = segue.destination as? DetailViewController {
                //secondViewController.property = sender as? Data
                guard let data = sender as? Product else { return }
                detailViewController.setData(data: data)
                print("Estou dentro da secondViewController \(detailViewController)")
            }
        }
    }
    
    private func productsInfo() {
      products = [Product(image: "person", name: "OMO Multiação", description: "Lava Roupa"), Product(image: "person.fill", name: "OMO Multiação2", description: "Lava Roupa"), Product(image: "person2", name: "OMO Multiação3", description: "Lava Roupa"), Product(image: "person2.fill", name: "OMO Multiação4", description: "Lava Roupa"), Product(image: "person.circle", name: "OMO Multiação5", description: "Lava Roupa")]
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let product = products[indexPath.row]
        
        cell.setup(product: product)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sender = products[indexPath.row]
        
        performSegue(withIdentifier: "showDetailViewController", sender: sender)
    }
}
