//
//  DetailViewController.swift
//  Desafio 2
//
//  Created by Felipe Brigagão de Almeida on 15/03/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    private var productDetail: Product?

    override func viewDidLoad() {
        super.viewDidLoad()

        if productDetail != nil {
            showData()
        }
    }
    
    func setData(data: Product) {
        self.productDetail = data
    }
    
    func showData() {
        imageLogo.image = UIImage(systemName: productDetail!.image)
        titleLabel.text = productDetail?.name
        descriptionLabel.text = productDetail?.description
    }
}
