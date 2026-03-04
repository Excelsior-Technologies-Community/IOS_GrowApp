//
//  ViewController.swift
//  GrowApp
//
//  Created by Noman belim on 02/03/26.
//

import UIKit
enum StockTab {
    case explore
    case holdings
    case positions
    case orders
    case watchlist
}
class ViewController: UIViewController  {
 
     
    var selectedTab: StockTab = .explore
    let watchlistStocks: [Stock] = [
        Stock(title: "Infosys", price: "₹1500", change: "+20 (1.3%)", isPositive: true),
        Stock(title: "HDFC Bank", price: "₹1650", change: "-10 (0.6%)", isPositive: false)
    ]
    let stocks: [Stock] = [
        Stock(title: "Tejas Networks", price: "₹485.60", change: "+49.75 (11.41%)", isPositive: true),
        Stock(title: "Tata Silver ETF", price: "₹27.84", change: "+2.19 (8.54%)", isPositive: true),
        Stock(title: "Tata Gold ETF", price: "₹16.20", change: "+0.80 (5.19%)", isPositive: true)
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
        collectionView.register(
            UINib(nibName: "ProductsToolsSectionCell", bundle: nil),
            forCellWithReuseIdentifier: "ProductsToolsSectionCell"
        )
        collectionView.register(
            UINib(nibName: "TabBarSectionCell", bundle: nil),
            forCellWithReuseIdentifier: "TabBarSectionCell"
        )
        collectionView.register(
            UINib(nibName: "CustomFourthCardCell", bundle: nil),
            forCellWithReuseIdentifier: "CustomFourthCardCell"
        )
    }


}



extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        switch section {

        case 0:
            return 1   // Header

        case 1:
            return 1   // Ticker

        case 2:
            return 1   // TabBar

        case 3:
            switch selectedTab {
            case .explore:
                return min(stocks.count, 3) + 1
            case .watchlist:
                return watchlistStocks.count
            case .holdings, .positions, .orders:
                return 1
            }
        case 4:
               return 1
        default:
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
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
                withReuseIdentifier: "TabBarSectionCell",
                for: indexPath
            ) as! TabBarSectionCell

            cell.selectedTab = selectedTab
            cell.onTabSelected = { [weak self] tab in
                self?.selectedTab = tab
                self?.collectionView.reloadSections(IndexSet(integer: 3))
            }

            return cell

    
        case 3:

            if selectedTab == .explore {

                // 4th card (custom card)
                if indexPath.item == stocks.count {

                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: "CustomFourthCardCell",
                        for: indexPath
                    ) as! CustomFourthCardCell

                    return cell
                }

                // Normal stock cards
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
            }

            // other tabs
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "MostBougthStock",
                for: indexPath
            ) as! MostBougthStock

            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ProductsToolsSectionCell",
                for: indexPath
            ) as! ProductsToolsSectionCell

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
            // 🔥 TAB BAR MUST BE FULL WIDTH
            return CGSize(width: collectionView.frame.width, height: 50)

        case 3:
            if selectedTab == .explore || selectedTab == .watchlist {
                let padding: CGFloat = 16 * 3
                let availableWidth = collectionView.frame.width - padding
                let width = availableWidth / 2
                return CGSize(width: width, height: 175)
            } else {
                return CGSize(width: collectionView.frame.width, height: 100)
            }

        case 4:
            return CGSize(width: collectionView.frame.width, height: 200)
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
