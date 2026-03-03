//
//  TickerItemCell.swift
//  GrowApp
//
//  Created by Noman belim on 03/03/26.
//

import UIKit

class TickerItemCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with ticker: TickerSectionCell.Ticker) {
          nameLabel.text = ticker.name
          priceLabel.text = ticker.price
          changeLabel.text = ticker.change

          changeLabel.textColor = ticker.isPositive ? .systemGreen : .systemRed
      }
}

