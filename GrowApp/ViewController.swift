//
//  ViewController.swift
//  GrowApp
//
//  Created by Noman belim on 02/03/26.
//

import UIKit

class ViewController: UIViewController  {
 
    let stocks: [Stock] = [
        Stock(title: "Tejas Networks", price: "₹485.60", change: "+49.75 (11.41%)", isPositive: true),
        Stock(title: "Tata Silver ETF", price: "₹27.84", change: "+2.19 (8.54%)", isPositive: true),
        Stock(title: "Tata Gold ETF", price: "₹16.20", change: "+0.80 (5.19%)", isPositive: true),
        Stock(title: "IdeaForge", price: "₹441.30", change: "+28.30 (6.85%)", isPositive: true)
    ]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "MostBougthStock", bundle: nil), forCellWithReuseIdentifier: "MostBougthStock")
        collectionView.register(UINib(nibName: "TopHeaderCell", bundle: nil), forCellWithReuseIdentifier: "TopHeaderCell")
        collectionView.register(UINib(nibName: "TickerSectionCell", bundle: nil), forCellWithReuseIdentifier: "TickerSectionCell")
        
    }


}



extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        switch section {
        case 0:
            return 1   // Header
        case 1:
            return 1   // Ticker section (contains inner collection)
        case 2:
            return stocks.count   // Stock grid
        default:
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {

        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "TopHeaderCell",
                for: indexPath
            ) as! TopHeaderCell
            return cell

        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "TickerSectionCell",
                for: indexPath
            ) as! TickerSectionCell
            return cell

        case 2:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "MostBougthStock",
                for: indexPath
            ) as! MostBougthStock

            let stock = stocks[indexPath.item]

            cell.configure(
                title: stock.title,
                price: stock.price,
                change: stock.change,
                isPositive: stock.isPositive
            )

            return cell

        default:
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch indexPath.section {

        case 0:
            return CGSize(width: collectionView.frame.width, height: 50)

        case 1:
            return CGSize(width: collectionView.frame.width, height: 50)

        case 2:
            let padding: CGFloat = 16 * 3
            let availableWidth = collectionView.frame.width - padding
            let width = availableWidth / 2
            return CGSize(width: width, height: 175)

        default:
            return .zero
        }
    }

    
}
struct Stock {
    let title: String
    let price: String
    let change: String
    let isPositive: Bool
}
