//
//  StockCardCell.swift
//  GrowApp
//
//  Created by Noman belim on 05/03/26.
//

import UIKit

class StockCardCell: UICollectionViewCell {
    @IBOutlet weak var logoImage: UIImageView!
      @IBOutlet weak var nameLabel: UILabel!
      @IBOutlet weak var priceLabel: UILabel!
      @IBOutlet weak var changeLabel: UILabel!

      override func awakeFromNib() {
          super.awakeFromNib()

          contentView.layer.cornerRadius = 16
          contentView.layer.borderWidth = 1
          contentView.layer.borderColor = UIColor.systemGray5.cgColor
      }
  }
