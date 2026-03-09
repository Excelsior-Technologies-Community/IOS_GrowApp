//
//  TradingScreenItemCell.swift
//  GrowApp
//
//  Created by Noman belim on 09/03/26.
//

import UIKit

class TradingScreenItemCell: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chartImage: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        cardView.layer.cornerRadius = 16
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.systemGray4.cgColor
    }

    func configure(item: TradingScreen) {

        titleLabel.text = item.title
        chartImage.image = UIImage(named: item.image)
        typeLabel.text = item.type

        if item.type == "Bullish" {
            typeLabel.textColor = .systemGreen
        } else {
            typeLabel.textColor = .systemRed
        }
    }
}
