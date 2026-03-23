//
//  SectorsTrendingCell.swift
//  GrowApp
//
//  Created by Noman belim on 10/03/26.
//

import UIKit

struct Sector {
    let name: String
    let change: String
    let progress: Float
    let icon: String
}

class SectorsTrendingCell: UICollectionViewCell,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var seeAllView: UIView!
    @IBOutlet weak var containerView: UIView!

    let sectors: [Sector] = [

        Sector(name: "Fertilizers", change: "+8.24%", progress: 0.8, icon: "fertilizer"),
        Sector(name: "Shipping", change: "+3.78%", progress: 0.5, icon: "shipping"),
        Sector(name: "Cables", change: "-2.51%", progress: 0.35, icon: "cable"),
        Sector(name: "Oil Drilling", change: "-4.04%", progress: 0.25, icon: "oil")
    ]

    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(
            UINib(nibName: "SectorItemCell", bundle: nil),
            forCellWithReuseIdentifier: "SectorItemCell"
        )

        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 0.6
        containerView.layer.borderColor = UIColor.lightGray.cgColor

        containerView.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        seeAllView.layer.cornerRadius = 16
        seeAllView.layer.borderWidth = 0.6
        seeAllView.layer.borderColor = UIColor.lightGray.cgColor
        seeAllView.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
        seeAllView.clipsToBounds = true
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return sectors.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "SectorItemCell",
            for: indexPath
        ) as! SectorItemCell

        let sector = sectors[indexPath.item]

        cell.configure(
            name: sector.name,
            change: sector.change,
            progress: sector.progress,
            icon: sector.icon
        )

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: 55)
    }
}
