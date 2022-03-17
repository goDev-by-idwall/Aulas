//
//  CustomCollectionViewCell.swift
//  Desafio 3
//
//  Created by Felipe Brigagão de Almeida on 16/03/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    static let identifier: String = "CustomCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.cornerRadius = 15
    }
    
    func setup(band: Band) {
        imageLogo.image = UIImage(named: band.image)
        nameLabel.text = band.name
        
    }
}
