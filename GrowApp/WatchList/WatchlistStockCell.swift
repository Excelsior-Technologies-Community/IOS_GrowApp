//
//  WatchlistStockCell.swift
//  GrowApp
//
//  Created by Noman belim on 05/03/26.
//

import UIKit

class WatchlistStockCell: UICollectionViewCell {

    @IBOutlet weak var stockNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var graphImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(stock: WatchlistStock) {
        stockNameLabel.text = stock.name
        priceLabel.text = stock.price
        changeLabel.text = stock.change
    }
}
