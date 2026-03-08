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
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.clipsToBounds = true
    }

    func configure() {

        img1.image = UIImage(named: "HDFC")
        img2.image = UIImage(named: "ICICI")
        img3.image = UIImage(named: "axis")
        img4.image = UIImage(named: "hcl")

        [img1, img2, img3, img4].forEach {
            $0?.contentMode = .scaleAspectFit
        }
    }
}
