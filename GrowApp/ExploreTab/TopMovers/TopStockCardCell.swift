//
//  StockCardCell.swift
//  GrowApp
//
//  Created by Noman belim on 05/03/26.
//

import UIKit

class TopStockCardCell: UICollectionViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var changeLabel: UILabel!
   

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.borderWidth = 0.6
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 16
    }

    
    func configure(stock: PositionStock) {

        nameLabel.text = stock.name
        priceLabel.text = "₹\(stock.price)"
        changeLabel.text = stock.change

        logoImage.image = UIImage(named: stock.logo)
    }
}
