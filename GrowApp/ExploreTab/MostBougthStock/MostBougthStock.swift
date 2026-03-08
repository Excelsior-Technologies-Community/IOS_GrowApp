//
//  MostBougthStock.swift
//  GrowApp
//
//  Created by Noman belim on 02/03/26.
//

import UIKit

 
class MostBougthStock: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    override func awakeFromNib() {
           super.awakeFromNib()

           // Card styling
           containerView.layer.cornerRadius = 16
           containerView.clipsToBounds = true
           containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor

           // Logo styling
           logoImageView.contentMode = .scaleAspectFit
       }

       // MARK: Configure Cell
       func configure(title: String,
                      price: String,
                      change: String,
                      logo: String,
                      isPositive: Bool) {

           titleLabel.text = title
           priceLabel.text = price
           changeLabel.text = change

           // Load image from Assets
           logoImageView.image = UIImage(named: logo)

           changeLabel.textColor = isPositive ? .systemGreen : .systemRed
       }
   }
