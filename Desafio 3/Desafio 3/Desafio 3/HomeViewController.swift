//
//  ViewController.swift
//  Desafio 3
//
//  Created by Felipe Brigagão de Almeida on 16/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var bands: [Band] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerTableViewCell()
        bands = Band.bandsInfo()
    }

    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerTableViewCell(){
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.setup(band: bands[indexPath.row])
        
        return cell
    }
}
