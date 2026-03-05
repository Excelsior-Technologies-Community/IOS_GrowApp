//
//  WatchlistHeaderCell.swift
//  GrowApp
//
//  Created by Noman belim on 05/03/26.
//

import UIKit

class WatchlistHeaderCell: UICollectionViewCell {

    @IBOutlet weak var FirstUI: UIView!
    @IBOutlet weak var SecoUI: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        FirstUI.layer.borderColor = UIColor.gray.cgColor
        FirstUI.layer.borderWidth = 0.5
        SecoUI.layer.borderColor = UIColor.gray.cgColor
        SecoUI.layer.borderWidth = 0.5
        FirstUI.layer.cornerRadius = FirstUI.frame.height / 2
        FirstUI.clipsToBounds = true
        SecoUI.layer.cornerRadius = FirstUI.frame.height / 2
        
         
    }

}
