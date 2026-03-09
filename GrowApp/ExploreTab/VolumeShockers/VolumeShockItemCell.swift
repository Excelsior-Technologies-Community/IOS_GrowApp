//
//  VolumeShockItemCell.swift
//  GrowApp
//
//  Created by Noman belim on 09/03/26.
//

import UIKit

import UIKit

class VolumeShockItemCell: UICollectionViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var border: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        logoImageView.contentMode = .scaleAspectFit
           
           logoImageView.layer.cornerRadius = 12
           logoImageView.layer.borderWidth = 1
           logoImageView.layer.borderColor = UIColor.systemGray4.cgColor
           
           logoImageView.backgroundColor = .white
           logoImageView.clipsToBounds = true
    }

    func configure(name: String,
                   change: String,
                   volume: String,
                   logo: String) {

        titleLabel.text = name
        changeLabel.text = change
        volumeLabel.text = volume
        logoImageView.image = UIImage(named: logo)

        // color logic
        if change.contains("-") {
            changeLabel.textColor = .systemRed
        } else {
            changeLabel.textColor = .systemGreen
        }
    }
}
