//
//  TickerSectionCell.swift
//  GrowApp
//
//  Created by Noman belim on 03/03/26.
//

import UIKit

class TickerSectionCell: UICollectionViewCell {
   
    struct Ticker {
        let name: String
        let price: String
        let change: String
        let isPositive: Bool
    }

    let tickers: [Ticker] = [
        Ticker(name: "NIFTY 50", price: "24,865.70", change: "-312.95", isPositive: false),
        Ticker(name: "SENSEX", price: "80,238.85", change: "-1,048.34", isPositive: false),
        Ticker(name: "BANK NIFTY", price: "59,839.65", change: "-689.35", isPositive: false)
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "TickerItemCell", bundle: nil), forCellWithReuseIdentifier: "TickerItemCell")
//        UIVIew.backgroundColor = UIColor.gray
        addDivider()
        
    }
    private func addDivider() {
        let divider = UIView()
        divider.backgroundColor = UIColor.systemGray4
        divider.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(divider)

        NSLayoutConstraint.activate([
            divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            divider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            divider.heightAnchor.constraint(equalToConstant: 0.9)
        ])
    }
}




extension TickerSectionCell:  UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tickers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TickerItemCell", for: indexPath) as! TickerItemCell
        cell.configure(with: tickers[indexPath.item])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 240, height: 50)
    }
}
