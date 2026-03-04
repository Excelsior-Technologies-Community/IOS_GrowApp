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
    let isPositive: Bool
}

class PositionsEmptyCell: UICollectionViewCell {

    var fiveMinStocks: [PositionStock] = [
        PositionStock(name: "Tejas Networks", price: "₹499.65", change: "+14.95 (3.08%)", isPositive: true),
        PositionStock(name: "Reliance Power", price: "₹23.17", change: "+0.19 (0.83%)", isPositive: true),
        PositionStock(name: "Bank of Maharashtra", price: "₹68.42", change: "-3.56 (4.95%)", isPositive: false)
    ]

    var fifteenMinStocks: [PositionStock] = [
        PositionStock(name: "Suzlon", price: "₹45.10", change: "+1.4%", isPositive: true),
        PositionStock(name: "Adani Power", price: "₹550", change: "+2.1%", isPositive: true),
        PositionStock(name: "IRFC", price: "₹150", change: "-0.8%", isPositive: false)
    ]

    var oneHourStocks: [PositionStock] = [
        PositionStock(name: "Tata Steel", price: "₹120", change: "+3.2%", isPositive: true),
        PositionStock(name: "HAL", price: "₹3400", change: "+1.5%", isPositive: true),
        PositionStock(name: "BEL", price: "₹230", change: "-0.6%", isPositive: false)
    ]
    var selectedFilter = 0
    @IBOutlet weak var UIone: UIButton!
    @IBOutlet weak var Card1: UIView!
    @IBOutlet weak var card2: UIView!
    @IBOutlet weak var card4: UIView!
    @IBOutlet weak var card5: UIView!
    @IBOutlet weak var UiTwo: UIButton!
    @IBOutlet weak var UIThree: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        UIone.layer.borderColor = UIColor.gray.cgColor
        UIone.layer.borderWidth = 0.3
     
        setupCard(Card1)
          setupCard(card2)
          setupCard(card4)
          setupCard(card5)
    
        UiTwo.layer.borderColor = UIColor.black.cgColor
        UiTwo.layer.borderWidth = 0.3
        
        UIThree.layer.borderColor = UIColor.black.cgColor
        UIThree.layer.borderWidth = 0.3
        UIone.layer.cornerRadius = 20
        UiTwo.layer.cornerRadius = 20
        UIThree.layer.cornerRadius = 20
        
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
        selectedFilter = 0
        updateCards()
        
    }
    @IBAction func btn2(_ sender: Any) {
        
        UIone.layer.borderWidth = 0.3
         UiTwo.layer.borderWidth = 1
         UIThree.layer.borderWidth = 0.3
        selectedFilter = 1
        updateCards()
        

    }
    
    @IBAction func btn3(_ sender: Any) {
        
        
        UIone.layer.borderWidth = 0.3
        
        
        UiTwo.layer.borderWidth = 0.3
        
        
        UIThree.layer.borderWidth = 1
        selectedFilter = 2
        updateCards()
        
        
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
