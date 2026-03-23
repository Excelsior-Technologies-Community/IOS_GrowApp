//
//  MostBoughtHeaderCell.swift
//  GrowApp
//
//  Created by Noman belim on 10/03/26.
//

import UIKit

class MostBoughtHeaderCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.text = "Most bought stocks"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
    }
}
