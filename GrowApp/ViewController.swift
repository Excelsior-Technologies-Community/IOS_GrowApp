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
struct Holding {
    let title: String
    let price: String
    let change: String
    let isPositive: Bool
}

var holdings: [Holding] = []

var tools: [String] = [
    "SIP",
    "Calculator",
    "Compare",
    "ETF"
]
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
        collectionView.register(UINib(nibName: "PositionsEmptyCell", bundle: nil), forCellWithReuseIdentifier: "PositionsEmptyCell")
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
        collectionView.register(
            UINib(nibName: "HoldingsCell", bundle: nil),
            forCellWithReuseIdentifier: "HoldingsCell"
        )
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        switch section {

        case 0:
            return 1   // Header

        case 1:
            
            return 1

        case 2:
            return 1   // TabBar

        case 3:

            switch selectedTab {

            case .explore:
                return min(stocks.count, 3) + 1

            case .positions:
                return 1   // important

            case .holdings:
                return holdings.isEmpty ? 1 : holdings.count

            case .watchlist:
                return watchlistStocks.count

            default:
                return 0
            }
        case 4:
            // Products section only in Explore
            return selectedTab == .explore ? 1 : 0

        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {

        case 0:
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "TopHeaderCell",
                for: indexPath
            ) as! TopHeaderCell

        case 1:
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "TickerSectionCell",
                for: indexPath
            ) as! TickerSectionCell

        case 2:

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "TabBarSectionCell",
                for: indexPath
            ) as! TabBarSectionCell

            cell.selectedTab = selectedTab

            cell.onTabSelected = { [weak self] tab in
                guard let self = self else { return }

                self.selectedTab = tab

                // reload sections affected by tab change
                self.collectionView.reloadSections(IndexSet([1,3,4]))
            }

            return cell

        case 3:

            switch selectedTab {

            case .explore:

                if indexPath.item == 3 {
                    return collectionView.dequeueReusableCell(
                        withReuseIdentifier: "CustomFourthCardCell",
                        for: indexPath
                    ) as! CustomFourthCardCell
                }

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

  
      
            case .positions:

                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "PositionsEmptyCell",
                    for: indexPath
                ) as! PositionsEmptyCell

                return cell
                
            case .holdings:

                if holdings.isEmpty {

                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: "HoldingsCell",
                        for: indexPath
                    ) as! HoldingsCell

                    return cell
                }

                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "MostBougthStock",
                    for: indexPath
                ) as! MostBougthStock

                let holding = holdings[indexPath.item]

                cell.configure(
                    title: holding.title,
                    price: holding.price,
                    change: holding.change,
                    isPositive: holding.isPositive
                )

                return cell
            case .watchlist:

                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "MostBougthStock",
                    for: indexPath
                ) as! MostBougthStock

                let stock = watchlistStocks[indexPath.item]

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

        case 4:

            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "ProductsToolsSectionCell",
                for: indexPath
            ) as! ProductsToolsSectionCell

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
            return CGSize(width: collectionView.frame.width, height: 50)

        case 3:

            switch selectedTab {

            case .explore, .watchlist:

                let padding: CGFloat = 16 * 3
                let availableWidth = collectionView.frame.width - padding
                let width = availableWidth / 2

                return CGSize(width: width, height: 175)

           
            case .positions:
                return CGSize(width: collectionView.frame.width, height: 700)
            case .holdings:

                if holdings.isEmpty {
                    // Empty holdings UI
                    return CGSize(width: collectionView.frame.width, height: 520)
                } else {
                    // Holdings list
                    return CGSize(width: collectionView.frame.width, height: 100)
                }

            default:
                return .zero
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
