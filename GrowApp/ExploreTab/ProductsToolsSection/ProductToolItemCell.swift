//
//  ProductToolItemCell.swift
//  GrowApp
//
//  Created by Noman belim on 03/03/26.
//

import UIKit

class ProductToolItemCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
      @IBOutlet weak var iconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    func configure(item: ProductItem) {
        titleLabel.text = item.title
        iconImageView.image = UIImage(named: item.imageName)
    }
}
