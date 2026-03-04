//
//  ProductsToolsSectionCell.swift
//  GrowApp
//
//  Created by Noman belim on 03/03/26.
//

import UIKit
struct ProductItem {
    let title: String
    let imageName: String
}
class ProductsToolsSectionCell: UICollectionViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
  
    let items: [ProductItem] = [
        ProductItem(title: "MTF", imageName: "MTF"),
        ProductItem(title: "Stock SIP", imageName: "SIP"),
        ProductItem(title: "ETF", imageName: "ETF"),
        ProductItem(title: "IPO", imageName: "IPO"),
        ProductItem(title: "Bonds", imageName: "Bonds")
    ]
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical   // Important
            layout.minimumInteritemSpacing = 16
            layout.minimumLineSpacing = 0
        }
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
        let item = items[indexPath.item]
        cell.configure(item: item)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let totalSpacing: CGFloat = 16 * 4   // spacing between 5 items
        let availableWidth = collectionView.frame.width - totalSpacing

        let width = availableWidth / 5

        return CGSize(width: width, height: 100)
    }
}
