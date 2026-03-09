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
enum TabType {
    case explore
    case positions
    case holdings
    case orders
}
var holdings: [Holding] = []

var tools: [String] = [
    "SIP",
    "Calculator",
    "Compare",
    "ETF"
]
struct WatchlistStock {
    let name: String
    let price: String
    let change: String
}


class ViewController: UIViewController  {
 
    var watchlistStocks: [WatchlistStock] = [
        WatchlistStock(name: "Vedanta", price: "₹733.05", change: "+32.05 (4.57%)"),
        WatchlistStock(name: "Tata Steel", price: "₹201.75", change: "+5.02 (2.55%)"),
        WatchlistStock(name: "NTPC", price: "₹376.95", change: "+11.15 (3.05%)"),
        WatchlistStock(name: "Eternal (Zomato)", price: "₹234.91", change: "-5.82 (2.42%)"),
        WatchlistStock(name: "PNB", price: "₹122.30", change: "+0.93 (0.77%)")
    ]
    var selectedTab: StockTab = .explore
  
    let stocks: [Stock] = [

        Stock(
            title: "Tejas Networks",
            price: "₹485.60",
            change: "+49.75 (11.41%)",
            image: "ICICI"
        ),

        Stock(
            title: "Tata Silver ETF",
            price: "₹27.84",
            change: "+2.19 (8.54%)",
            image: "hcl"
        ),

        Stock(
            title: "Tata Gold ETF",
            price: "₹16.20",
            change: "+0.80 (5.19%)",
            image: "HDFC"
        )
    ]
    @IBOutlet weak var collectionView: UICollectionView!
    var topMoversCardsCell: TopMoversCardsCell?
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
            UINib(nibName: "OrdersEmptyCell", bundle: nil),
            forCellWithReuseIdentifier: "OrdersEmptyCell"
        )
        collectionView.register(
            UINib(nibName: "TradingScreensCell", bundle: nil),
            forCellWithReuseIdentifier: "TradingScreensCell"
        )
        collectionView.register(
            UINib(nibName: "ProductsToolsSectionCell", bundle: nil),
            forCellWithReuseIdentifier: "ProductsToolsSectionCell"
        )
        collectionView.register(
            UINib(nibName: "VolumeShockersCell", bundle: nil),
            forCellWithReuseIdentifier: "VolumeShockersCell"
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
        collectionView.register(
             UINib(nibName: "WatchlistHeaderCell", bundle: nil),
             forCellWithReuseIdentifier: "WatchlistHeaderCell"
         )

         collectionView.register(
             UINib(nibName: "WatchlistSortCell", bundle: nil),
             forCellWithReuseIdentifier: "WatchlistSortCell"
         )

         collectionView.register(
             UINib(nibName: "WatchlistStockCell", bundle: nil),
             forCellWithReuseIdentifier: "WatchlistStockCell"
         )
        collectionView.register(
            UINib(nibName: "TopMoversHeaderCell", bundle: nil),
            forCellWithReuseIdentifier: "TopMoversHeaderCell"
        )

        collectionView.register(
            UINib(nibName: "TopMoversCardsCell", bundle: nil),
            forCellWithReuseIdentifier: "TopMoversCardsCell"
        )
    }


}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: - Sections

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }

    // MARK: - Items Count

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        switch section {

        case 0:
            return 1   // Top Header

        case 1:
            return 1   // Ticker

        case 2:
            return 1   // Tab Bar

        case 3:

            switch selectedTab {

            case .explore:
                return min(stocks.count, 3) + 1

            case .positions:
                return 1

            case .holdings:
                return holdings.isEmpty ? 1 : holdings.count

            case .watchlist:
                return watchlistStocks.count + 2

            case .orders:
                return 1

            default:
                return 0
            }

        case 4:
            return selectedTab == .explore ? 1 : 0   // Products section

        case 5:
            return 2   // Top Movers

        case 6:
            return selectedTab == .explore ? 1 : 0   // Volume Shockers

        case 7:
            return selectedTab == .explore ? 1 : 0   // Trading Screens

        default:
            return 0
        }
    }

    // MARK: - Cell Setup

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {

        // Header
        case 0:
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "TopHeaderCell",
                for: indexPath
            ) as! TopHeaderCell

        // Ticker
        case 1:
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "TickerSectionCell",
                for: indexPath
            ) as! TickerSectionCell

        // Tab Bar
        case 2:

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "TabBarSectionCell",
                for: indexPath
            ) as! TabBarSectionCell

            cell.selectedTab = selectedTab

            cell.onTabSelected = { [weak self] tab in
                guard let self = self else { return }

                self.selectedTab = tab
                self.collectionView.reloadSections(IndexSet([1,3,4,5,6,7]))
            }

            return cell

        // Most Bought Stocks
        case 3:

            switch selectedTab {

            case .explore:

                if indexPath.item == 3 {

                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: "CustomFourthCardCell",
                        for: indexPath
                    ) as! CustomFourthCardCell

                    cell.configure()
                    return cell
                }

                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "MostBougthStock",
                    for: indexPath
                ) as! MostBougthStock

                let stock = stocks[indexPath.item]

                cell.configure(
                    title: stock.title,
                    price: "₹\(stock.price)",
                    change: stock.change,
                    logo: stock.image,
                    isPositive: stock.change.contains("+")
                )

                return cell

            case .positions:

                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: "PositionsEmptyCell",
                    for: indexPath
                ) as! PositionsEmptyCell

            case .holdings:

                if holdings.isEmpty {

                    return collectionView.dequeueReusableCell(
                        withReuseIdentifier: "HoldingsCell",
                        for: indexPath
                    ) as! HoldingsCell
                }

                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "MostBougthStock",
                    for: indexPath
                ) as! MostBougthStock

                cell.configure(
                    title: "ETF",
                    price: "₹499.55",
                    change: "+14 (3.08%)",
                    logo: "ETF",
                    isPositive: true
                )

                return cell

            case .watchlist:

                if indexPath.item == 0 {

                    return collectionView.dequeueReusableCell(
                        withReuseIdentifier: "WatchlistHeaderCell",
                        for: indexPath
                    ) as! WatchlistHeaderCell
                }

                if indexPath.item == 1 {

                    return collectionView.dequeueReusableCell(
                        withReuseIdentifier: "WatchlistSortCell",
                        for: indexPath
                    ) as! WatchlistSortCell
                }

                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "WatchlistStockCell",
                    for: indexPath
                ) as! WatchlistStockCell

                let stock = watchlistStocks[indexPath.item - 2]
                cell.configure(stock: stock)

                return cell

            case .orders:

                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: "OrdersEmptyCell",
                    for: indexPath
                ) as! OrdersEmptyCell

            default:
                return UICollectionViewCell()
            }

        // Products
        case 4:

            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "ProductsToolsSectionCell",
                for: indexPath
            ) as! ProductsToolsSectionCell

        // Top Movers
        case 5:

            if indexPath.item == 0 {

                let headerCell = collectionView.dequeueReusableCell(
                    withReuseIdentifier:"TopMoversHeaderCell",
                    for:indexPath
                ) as! TopMoversHeaderCell

                headerCell.onFilterChange = { [weak self] type in
                    self?.topMoversCardsCell?.updateStocks(type: type)
                }

                return headerCell
            }

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier:"TopMoversCardsCell",
                for:indexPath
            ) as! TopMoversCardsCell

            topMoversCardsCell = cell

            return cell

        // Volume Shockers
        case 6:

            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "VolumeShockersCell",
                for: indexPath
            ) as! VolumeShockersCell

        // Trading Screens
        case 7:

            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "TradingScreensCell",
                for: indexPath
            ) as! TradingScreensCell

        default:
            return UICollectionViewCell()
        }
    }

    // MARK: - Cell Sizes

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch indexPath.section {

        case 0,1,2:
            return CGSize(width: collectionView.frame.width, height: 50)

        case 3:

            switch selectedTab {

            case .explore:

                let padding: CGFloat = 16 * 3
                let width = (collectionView.frame.width - padding) / 2

                return CGSize(width: width, height: 175)

            case .positions:
                return CGSize(width: collectionView.frame.width, height: 850)

            case .holdings:
                return CGSize(width: collectionView.frame.width,
                              height: holdings.isEmpty ? 520 : 100)

            case .orders:
                return CGSize(width: collectionView.frame.width, height: 300)

            case .watchlist:

                if indexPath.item == 0 {
                    return CGSize(width: collectionView.frame.width, height: 60)
                }

                if indexPath.item == 1 {
                    return CGSize(width: collectionView.frame.width, height: 40)
                }

                return CGSize(width: collectionView.frame.width, height: 80)

            default:
                return .zero
            }

        case 4:
            return CGSize(width: collectionView.frame.width, height: 200)

        case 5:

            if indexPath.item == 0 {
                return CGSize(width: collectionView.frame.width, height: 100)
            }

            return CGSize(width: collectionView.frame.width, height: 400)

        case 6:
            return CGSize(width: collectionView.frame.width, height: 480)

        case 7:
            return CGSize(width: collectionView.frame.width, height: 520)

        default:
            return .zero
        }
    }
}

struct Stock {
    let title: String
    let price: String
    let change: String
    let image: String
}
