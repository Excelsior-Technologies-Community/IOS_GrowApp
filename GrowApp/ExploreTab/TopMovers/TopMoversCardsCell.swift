//
//  TopMoversCardsCell.swift
//  GrowApp
//
//  Created by Noman belim on 05/03/26.
//

import UIKit

struct TopMoverStock {
    let name: String
    let price: String
    let change: String
    let logo: String
}
class TopMoversCardsCell: UICollectionViewCell,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {

    

 
    @IBOutlet weak var cardsCollectionView: UICollectionView!
   
    
    var currentStocks: [PositionStock] = []

    var fiveMinStocks: [PositionStock] = [
        PositionStock(name: "Tata ETF", price: "499.55", change: "+14 (3.08%)", logo: "Tata"),
        PositionStock(name: "Reliance", price: "2490.10", change: "+22 (0.90%)", logo: "Reliance"),
        PositionStock(name: "Infosys", price: "1560.30", change: "+10 (0.64%)", logo: "Infosys")
    ]

    var fifteenMinStocks: [PositionStock] = [
        PositionStock(name: "HDFC Bank", price: "1650", change: "+12 (0.70%)", logo: "HDFC"),
        PositionStock(name: "ICICI Bank", price: "980.5", change: "+8 (0.50%)", logo: "ICICI"),
        PositionStock(name: "Axis Bank", price: "1102", change: "+6 (0.45%)", logo: "axis")
    ]

    var oneHourStocks: [PositionStock] = [
        PositionStock(name: "TCS", price: "3990", change: "+25 (0.60%)", logo: "tcs"),
        PositionStock(name: "Wipro", price: "520", change: "+4 (0.80%)", logo: "wipro"),
        PositionStock(name: "HCL Tech", price: "1345", change: "+9 (0.72%)", logo: "hcl")
    ]

    override func awakeFromNib() {
        super.awakeFromNib()

        cardsCollectionView.delegate = self
        cardsCollectionView.dataSource = self

        currentStocks = fiveMinStocks

        // Register MostBoughtStock cell
        cardsCollectionView.register(
            UINib(nibName: "MostBougthStock", bundle: nil),
            forCellWithReuseIdentifier: "MostBougthStock"
        )

        // Register See More card
        cardsCollectionView.register(
            UINib(nibName: "CustomFourthCardCell", bundle: nil),
            forCellWithReuseIdentifier: "CustomFourthCardCell"
        )
    }

    func updateStocks(type: TopMoverFilter) {

        switch type {

        case .gainers:
            currentStocks = fifteenMinStocks

        case .losers:
            currentStocks = fiveMinStocks

        case .largeCap:
            currentStocks = oneHourStocks

        case .midCap:
            currentStocks = fifteenMinStocks

        case .smallCap:
            currentStocks = fiveMinStocks
        }

        cardsCollectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let padding: CGFloat = 16 + 16 + 12
        let availableWidth = collectionView.frame.width - padding
        let width = availableWidth / 2

        return CGSize(width: width, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // 4th card → See More
        if indexPath.item == 3 {

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "CustomFourthCardCell",
                for: indexPath
            ) as! CustomFourthCardCell

            cell.configure()
            return cell
        }

        // First 3 cards → Stock cards
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MostBougthStock",
            for: indexPath
        ) as! MostBougthStock

        let stock = currentStocks[indexPath.item]

        cell.configure(
            title: stock.name,
            price: "₹\(stock.price)",
            change: stock.change,
            logo: stock.logo,
            isPositive: stock.change.contains("+")
        )

        return cell
    }
}
