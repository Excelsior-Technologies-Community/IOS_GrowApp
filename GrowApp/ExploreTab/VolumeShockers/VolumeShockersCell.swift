//
//  VolumeShockersCell.swift
//  GrowApp
//
//  Created by Noman belim on 09/03/26.
//

import UIKit

import UIKit

struct VolumeStock {
    let name: String
    let change: String
    let volume: String
    let logo: String
}

class VolumeShockersCell: UICollectionViewCell,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var CollectionViewUi: UIView!
    @IBOutlet weak var collectionView: UICollectionView!

    let stocks: [VolumeStock] = [

        VolumeStock(
            name: "ICICI",
            change: "+6,716%",
            volume: "1,19,992",
            logo: "ICICI"
        ),

        VolumeStock(
            name: "Rane Holdings",
            change: "+1,401%",
            volume: "1,10,159",
            logo: "Rane"
        ),

        VolumeStock(
            name: "Apollo Pipes",
            change: "+994%",
            volume: "22,79,679",
            logo: "Apollo"
        ),

        VolumeStock(
            name: "Jindal Poly Investment",
            change: "+753%",
            volume: "95,441",
            logo: "Jindal"
        )
    ]

    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.delegate = self
        collectionView.dataSource = self

        
        CollectionViewUi.layer.cornerRadius = 15
        CollectionViewUi.layer.borderColor = UIColor.lightGray.cgColor
        CollectionViewUi.layer.borderWidth = 0.8
        collectionView.register(
            UINib(nibName: "VolumeShockItemCell", bundle: nil),
            forCellWithReuseIdentifier: "VolumeShockItemCell"
        )
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        return stocks.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "VolumeShockItemCell",
            for: indexPath
        ) as! VolumeShockItemCell

        let stock = stocks[indexPath.item]

        cell.configure(
            name: stock.name,
            change: stock.change,
            volume: stock.volume,
            logo: stock.logo
        )

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: 72)
    }
}
