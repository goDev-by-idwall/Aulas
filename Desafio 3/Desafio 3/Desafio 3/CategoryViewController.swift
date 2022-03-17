//
//  CategoryViewController.swift
//  Desafio 3
//
//  Created by Felipe Brigagão de Almeida on 16/03/22.
//

import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var bands: [Band] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegates()
        registerCollectionView()
        collectionLayout()
        bands = Band.bandsInfo()
    }
    
    private func delegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerCollectionView() {
        let nib = UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
    
    func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        let size = Int(view.frame.size.width / 2)
        
        layout.itemSize = CGSize(width: size - 5, height: size)
        layout.minimumLineSpacing = 10
        
        collectionView.collectionViewLayout = layout
    }
}

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setup(band: bands[indexPath.row])
        
        return cell
    }
}
