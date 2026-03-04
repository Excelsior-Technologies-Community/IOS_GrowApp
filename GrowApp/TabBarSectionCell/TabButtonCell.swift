//
//  TabButtonCell.swift
//  GrowApp
//
//  Created by Noman belim on 03/03/26.
//

import UIKit

import UIKit

class TabButtonCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    private let baseLineView = UIView()
    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.layer.cornerRadius = 18
        contentView.layer.masksToBounds = true
        
    }

    func configure(with tab: StockTab, selected: Bool) {
        titleLabel.text = title(for: tab)

        if selected {
            contentView.backgroundColor = .white
            titleLabel.textColor = .black
        } else {
            contentView.backgroundColor = .clear
            titleLabel.textColor = .gray
        }
    }

    private func title(for tab: StockTab) -> String {
        switch tab {
        case .explore: return "Explore"
        case .holdings: return "Holdings"
        case .positions: return "Positions"
        case .orders: return "Orders"
        case .watchlist: return "My Watchlist"
        }
    }
}
