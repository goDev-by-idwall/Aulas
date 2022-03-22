//
//  ViewController.swift
//  Desafio 4
//
//  Created by Felipe Brigagão de Almeida on 21/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    lazy var personalities = [Personality]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegates()
        getPersonalities()
        registerTableViewCell()
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerTableViewCell(){
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    private func getPersonalities() {
        Service.shared.getPersonalities { result in
            switch result {
            case .success(let res):
                self.personalities = res
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personalities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        let personality = personalities[indexPath.row]
        
        cell.setup(personality: personality)
        
        return cell
    }
}
