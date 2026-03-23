//
//  SectorItemCell.swift
//  GrowApp
//
//  Created by Noman belim on 10/03/26.
//

import UIKit

class SectorItemCell: UICollectionViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var changeLabel: UILabel!

    func configure(name: String, change: String, progress: Float, icon: String) {

        titleLabel.text = name
        changeLabel.text = change
        iconImage.image = UIImage(named: icon)

        progressView.progress = progress

        if change.contains("-") {
            changeLabel.textColor = .systemRed
            progressView.progressTintColor = .systemRed
        } else {
            changeLabel.textColor = .systemGreen
            progressView.progressTintColor = .systemGreen
        }
    }
}
