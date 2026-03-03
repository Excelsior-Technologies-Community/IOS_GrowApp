//
//  TopHeaderCell.swift
//  GrowApp
//
//  Created by Noman belim on 03/03/26.
//

import UIKit

class TopHeaderCell: UICollectionViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
     @IBOutlet weak var titleLabel: UILabel!
     @IBOutlet weak var searchImageView: UIImageView!
     @IBOutlet weak var gridImageView: UIImageView!
     @IBOutlet weak var profileImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
               profileImageView.clipsToBounds = true
    }

}
