//
//  TopMoversHeaderCell.swift
//  GrowApp
//
//  Created by Noman belim on 05/03/26.
//

import UIKit

enum TopMoverFilter {
    case gainers
    case losers
    case largeCap
    case midCap
    case smallCap
}

class TopMoversHeaderCell: UICollectionViewCell {

    var onFilterChange: ((TopMoverFilter) -> Void)?
    var currentCapIndex = 0

    let capTitles = ["Large cap", "Mid cap", "Small cap"]
    @IBOutlet weak var gainersButton: UIButton!
    @IBOutlet weak var losersButton: UIButton!
    @IBOutlet weak var capButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        [gainersButton, losersButton, capButton].forEach {
            $0?.layer.cornerRadius = 20
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.lightGray.cgColor
        }

        updateButtonStyles(selected: gainersButton)
    }
    @IBAction func gainersTapped(_ sender: UIButton) {
        
        updateButtonStyles(selected: sender)

          onFilterChange?(.gainers)
    }

    @IBAction func losersTapped(_ sender: UIButton) {
        updateButtonStyles(selected: sender)

        onFilterChange?(.losers)
    }
    @IBAction func Caps(_ sender: UIButton) {
        
        currentCapIndex += 1

           if currentCapIndex >= capTitles.count {
               currentCapIndex = 0
           }

           let title = capTitles[currentCapIndex]

           capButton.setTitle(title, for: .normal)

           updateButtonStyles(selected: sender)

           switch title {

           case "Large cap":
               onFilterChange?(.largeCap)

           case "Mid cap":
               onFilterChange?(.midCap)

           case "Small cap":
               onFilterChange?(.smallCap)

           default:
               break
           }
    }
    func updateButtonStyles(selected: UIButton) {

        let buttons = [gainersButton, losersButton, capButton]

        buttons.forEach { button in
            button?.backgroundColor = .white
            button?.layer.borderColor = UIColor.lightGray.cgColor
        }

        selected.backgroundColor = UIColor.systemGray5
        selected.layer.borderColor = UIColor.black.cgColor
    }
}


enum FilterType {
    case gainers
    case losers
}
