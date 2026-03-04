//
//  TabBarSectionCell.swift
//  GrowApp
//
//  Created by Noman belim on 03/03/26.
//

import UIKit

class TabBarSectionCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    private let indicatorView = UIView()
    var tabs: [StockTab] = [.explore, .holdings, .positions, .orders, .watchlist]
    var selectedTab: StockTab = .explore
    var onTabSelected: ((StockTab) -> Void)?
    private var indicatorLeadingConstraint: NSLayoutConstraint?
    private let baseLineView = UIView()
    private var indicatorWidthConstraint: NSLayoutConstraint?
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        indicatorView.backgroundColor = .white
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(indicatorView)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.estimatedItemSize = .zero   // 🔥 VERY IMPORTANT
        }

        // Base line under all tabs
        baseLineView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        baseLineView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(baseLineView)

        NSLayoutConstraint.activate([
            baseLineView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            baseLineView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            baseLineView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            baseLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        collectionView.register(
            UINib(nibName: "TabButtonCell", bundle: nil),
            forCellWithReuseIdentifier: "TabButtonCell"
        )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if indicatorLeadingConstraint == nil {
            setupIndicator()

            DispatchQueue.main.async {
                let initialIndex = IndexPath(item: 0, section: 0)
                self.moveIndicator(to: initialIndex)
            }
        }
    }
    private func moveIndicator(to indexPath: IndexPath) {

        collectionView.layoutIfNeeded()

        guard let attributes = collectionView.layoutAttributesForItem(at: indexPath) else { return }

        let cellFrame = attributes.frame

        indicatorLeadingConstraint?.constant = cellFrame.origin.x
        indicatorWidthConstraint?.constant = cellFrame.width

        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
    private func setupIndicator() {

        indicatorView.backgroundColor = .black
        indicatorView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(indicatorView)

        indicatorLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor)
        indicatorWidthConstraint = indicatorView.widthAnchor.constraint(equalToConstant: 40)

        NSLayoutConstraint.activate([
            indicatorLeadingConstraint!,
            indicatorWidthConstraint!,
            indicatorView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            indicatorView.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
}

extension TabBarSectionCell: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        print("Tabs count:", tabs.count)
        return tabs.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TabButtonCell",
            for: indexPath
        ) as! TabButtonCell

        let tab = tabs[indexPath.item]
        cell.configure(with: tab, selected: tab == selectedTab)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        selectedTab = tabs[indexPath.item]
        collectionView.reloadData()

        DispatchQueue.main.async {
            self.moveIndicator(to: indexPath)
        }

        onTabSelected?(selectedTab)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let tab = tabs[indexPath.item]
        let title = title(for: tab)

        let width = title.size(withAttributes: [
            .font: UIFont.systemFont(ofSize: 17)
        ]).width

        return CGSize(width: width + 32, height: 36)
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
