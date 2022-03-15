//
//  ViewController.swift
//  Aula 06-3
//
//  Created by Felipe Brigagão de Almeida on 14/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    let teams = ["person.fill", "person", "person.circle", "person.circle.fill", "person.2", "person.2.fill"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerCell()
        layoutCollection()
        
        collection.showsVerticalScrollIndicator = false
    }

    private func delegates() {
        collection.delegate = self
        collection.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: ItemCollectionViewCell.identifier, bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }
    
    private func layoutCollection() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        collection.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("O item \(indexPath.row) foi tocado na Collection View.")
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        
        let team = teams[indexPath.row]
        
        cell.setup(image: team)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
