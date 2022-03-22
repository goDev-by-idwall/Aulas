//
//  CustomTableViewCell.swift
//  Desafio 4
//
//  Created by Felipe Brigagão de Almeida on 21/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var personalityImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    static let identifier = "CustomTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(personality: Personality) {
        personalityImage.layer.cornerRadius = 15
        personalityImage.loadImage(from: personality.photo)
        
        nameLabel.text = personality.name
        companyLabel.text = personality.companies.name
    }
    
}
