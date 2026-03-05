//
//  CustomFourthCardCell.swift
//  GrowApp
//
//  Created by Noman belim on 04/03/26.
//

import UIKit

class CustomFourthCardCell: UICollectionViewCell {

    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!

    @IBOutlet weak var seeMoreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.gray.cgColor
    }

}
