//
//  PortfolioCollectionViewCell.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/16.
//

import UIKit

class PortfolioCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var PortfolioProfileImage: UIImageView!
    @IBOutlet weak var portfolioName: UILabel!
    @IBOutlet weak var star: UIButton!
    @IBOutlet weak var eye: UIButton!
    @IBOutlet weak var starCount: UILabel!
    @IBOutlet weak var eyeCount: UILabel!
    @IBOutlet weak var introduceLabel: UITextView!
    
    var starisSelected: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        star.setImage((UIImage(named: "Olio_Gray_Star")), for: .normal)
  
        PortfolioProfileImage.layer.cornerRadius = 15
    }
    
    @IBAction func star(_ sender: Any) {
        if starisSelected == false{
            star.setImage(UIImage(named: "Olio_Yellow_Star"), for: .normal)
            starisSelected = true
        }else{
            
            starisSelected = false
        }
    }
}

