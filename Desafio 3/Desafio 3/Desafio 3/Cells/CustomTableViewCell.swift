//
//  CustomTableViewCell.swift
//  Desafio 3
//
//  Created by Felipe Brigagão de Almeida on 16/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    static let identifier: String = "CustomTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(band: Band) {
        imageLogo.image = UIImage(named: band.image)
        nameLabel.text = band.name
        descLabel.text = band.genre
    }
}
