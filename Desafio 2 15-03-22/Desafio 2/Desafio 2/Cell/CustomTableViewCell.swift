//
//  CustomTableViewCell.swift
//  Desafio 2
//
//  Created by Felipe Brigagão de Almeida on 15/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    static let identifier: String = "CustomTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(product: Product) {
        productImage.image = UIImage(systemName: product.image)
        titleLabel.text = product.name
        descriptionLabel.text = product.description
    }
}
