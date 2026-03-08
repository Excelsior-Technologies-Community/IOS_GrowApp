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
    let gainersStocks:[TopMoverStock] = [
        TopMoverStock(name:"Mazagon Dock", price:"₹2299", change:"+6.17%", logo:"logo1"),
        TopMoverStock(name:"Hindalco", price:"₹969", change:"+5.21%", logo:"logo2"),
        TopMoverStock(name:"Coal India", price:"₹455", change:"+4.73%", logo:"logo3")
    ]

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
    let losersStocks:[TopMoverStock] = [
        TopMoverStock(name:"Zomato", price:"₹234", change:"-2.42%", logo:"logo4"),
        TopMoverStock(name:"Paytm", price:"₹390", change:"-1.55%", logo:"logo5"),
        TopMoverStock(name:"Nykaa", price:"₹145", change:"-1.10%", logo:"logo6")
    ]

    override func awakeFromNib() {
        super.awakeFromNib()

        cardsCollectionView.delegate = self
        cardsCollectionView.dataSource = self

        currentStocks = fiveMinStocks
         
          cardsCollectionView.register(
              UINib(nibName: "TopStockCardCell", bundle: nil),
              forCellWithReuseIdentifier: "TopStockCardCell"
          )

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
    

    func collectionView(_ collectionView:UICollectionView,
                        numberOfItemsInSection section:Int)->Int{
        return 4
    }

    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let padding: CGFloat = 16 + 16 + 12   // left + right + space between cards
        let availableWidth = collectionView.frame.width - padding
        let width = availableWidth / 2

        return CGSize(width: width, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.item == 3 {

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "CustomFourthCardCell",
                for: indexPath
            ) as! CustomFourthCardCell

            cell.configure()
            return cell
        }

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TopStockCardCell",
            for: indexPath
        ) as! TopStockCardCell

        let stock = currentStocks[indexPath.item]

        cell.configure(stock: stock)

        return cell
    }
}
