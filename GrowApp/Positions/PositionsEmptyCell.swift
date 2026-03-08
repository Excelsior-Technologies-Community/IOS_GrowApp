//
//  PositionsEmptyCell.swift
//  GrowApp
//
//  Created by Noman belim on 04/03/26.
//

import UIKit
struct PositionStock {
    let name: String
    let price: String
    let change: String
    let logo: String
}

 

class PositionsEmptyCell: UICollectionViewCell {

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
    
    var selectedFilter = 0
    var currentStocks: [PositionStock] = []
    @IBOutlet weak var UIone: UIButton!
    @IBOutlet weak var Card1: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var card2: UIView!
    @IBOutlet weak var card4: UIView!
    @IBOutlet weak var card5: UIView!
    @IBOutlet weak var UiTwo: UIButton!
    @IBOutlet weak var CollectionVIew: UICollectionView!
    @IBOutlet weak var UIThree: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        UIone.layer.borderColor = UIColor.gray.cgColor
        UIone.layer.borderWidth = 0.3
     
//        setupCard(Card1)
//          setupCard(card2)
//          setupCard(card4)
//          setupCard(card5)
    
        currentStocks = fiveMinStocks
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            UINib(nibName: "StockCardCell", bundle: nil),
            forCellWithReuseIdentifier: "StockCardCell"
        )
        collectionView.register(UINib(nibName: "StockCardCell", bundle: nil),
                                forCellWithReuseIdentifier: "StockCardCell")

        collectionView.register(UINib(nibName: "CustomFourthCardCell", bundle: nil),
                                forCellWithReuseIdentifier: "CustomFourthCardCell")
        UiTwo.layer.borderColor = UIColor.black.cgColor
        UiTwo.layer.borderWidth = 0.3
        
        UIThree.layer.borderColor = UIColor.black.cgColor
        UIThree.layer.borderWidth = 0.3
        UIone.layer.cornerRadius = 15
        UiTwo.layer.cornerRadius = 15
        UIThree.layer.cornerRadius = 15
        
    }
    func setupCard(_ view: UIView) {
        view.layer.borderColor = UIColor.systemGray4.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 18
        view.clipsToBounds = true
    }
    @IBAction func btn1(_ sender: Any) {
        
        
        UIone.layer.borderWidth = 1
        UiTwo.layer.borderWidth = 0.3
        UIThree.layer.borderWidth = 0.3
        currentStocks = fiveMinStocks
          collectionView.reloadData()
        
    }
    @IBAction func btn2(_ sender: Any) {
        
        UIone.layer.borderWidth = 0.3
         UiTwo.layer.borderWidth = 1
         UIThree.layer.borderWidth = 0.3
        currentStocks = fifteenMinStocks
        collectionView.reloadData()
        

    }
    
    @IBAction func btn3(_ sender: Any) {
        
        
        UIone.layer.borderWidth = 0.3
        
        
        UiTwo.layer.borderWidth = 0.3
        
        
        UIThree.layer.borderWidth = 1
        
        currentStocks = oneHourStocks
        collectionView.reloadData()
        
        
    }
    
    
    func  updateCards(){
        
        
        var stocks : [PositionStock] = []
        if selectedFilter == 0{
            stocks = fiveMinStocks
        }
        else if selectedFilter == 0{
            stocks = fifteenMinStocks
        }
        else {
            stocks = oneHourStocks
        }
    }
    
}
extension PositionsEmptyCell: UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.item < 3 {

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "StockCardCell",
                for: indexPath
            ) as! StockCardCell

            let stock = currentStocks[indexPath.item]

            

            cell.nameLabel.text = stock.name
            cell.priceLabel.text = stock.price
            cell.changeLabel.text = stock.change
            cell.logoImage.image = UIImage(named: stock.logo)
            cell.nameLabel.text = stock.name
            cell.priceLabel.text = stock.price
            cell.changeLabel.text = stock.change

            return cell
        }

        else {

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "CustomFourthCardCell",
                for: indexPath
            ) as! CustomFourthCardCell

            cell.configure()
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.width - 16) / 2
        return CGSize(width: width, height: 160)
    }
}
