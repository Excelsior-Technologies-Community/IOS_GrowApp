//
//  ProductsToolsSectionCell.swift
//  GrowApp
//
//  Created by Noman belim on 03/03/26.
//

import UIKit

class ProductsToolsSectionCell: UICollectionViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    let items = ["MTF", "Stock SIP", "ETF", "IPO", "Bonds"]
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(
            UINib(nibName: "ProductToolItemCell", bundle: nil),
            forCellWithReuseIdentifier: "ProductToolItemCell"
        )
        
    }

}
extension ProductsToolsSectionCell:
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ProductToolItemCell",
            for: indexPath
        ) as! ProductToolItemCell
        print("Loading item:", indexPath.item)
        cell.configure(title: items[indexPath.item])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 90, height: 100)
    }
}
