//
//  MostBougthStock.swift
//  GrowApp
//
//  Created by Noman belim on 02/03/26.
//

import UIKit

import UIKit

class MostBougthStock: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        // Dark card styling
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.black.cgColor
    }

    func configure(title: String,
                   price: String,
                   change: String,
                   isPositive: Bool) {

        titleLabel.text = title
        priceLabel.text = price
        changeLabel.text = change

        changeLabel.textColor = isPositive ? .systemGreen : .systemRed
    }
}
