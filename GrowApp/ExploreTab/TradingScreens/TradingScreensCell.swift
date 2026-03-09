//
//  TradingScreensCell.swift
//  GrowApp
//
//  Created by Noman belim on 09/03/26.
//

import UIKit

struct TradingScreen {
    let title: String
    let image: String
    let type: String
}

class TradingScreensCell: UICollectionViewCell,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var FilterView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!

    let items: [TradingScreen] = [

        TradingScreen(
            title: "Resistance breakouts",
            image: "TradingScreenone",
            type: "Bullish"
        ),

        TradingScreen(
            title: "RSI overbought",
            image: "TradingScreentwo",
            type: "Bearish"
        ),

        TradingScreen(
            title: "MACD above signal line",
            image: "TradingScreenthree",
            type: "Bullish"
        ),

        TradingScreen(
            title: "RSI oversold",
            image: "TradingScreenfour",
            type: "Bullish"
        )
    ]

    override func awakeFromNib() {
        super.awakeFromNib()

        FilterView.layer.cornerRadius = 10
        FilterView.layer.borderColor = UIColor.lightGray.cgColor
        FilterView.layer.borderWidth = 0.5
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(
            UINib(nibName: "TradingScreenItemCell", bundle: nil),
            forCellWithReuseIdentifier: "TradingScreenItemCell"
        )
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TradingScreenItemCell",
            for: indexPath
        ) as! TradingScreenItemCell

        let item = items[indexPath.item]

        cell.configure(item: item)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let padding: CGFloat = 12
        let width = (collectionView.frame.width - padding) / 2

        return CGSize(width: width, height: 155)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
