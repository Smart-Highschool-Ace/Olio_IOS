//
//  AwardWinningCareerTableViewCell.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/29.
//

import UIKit

class AwardWinningCareerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var awardWinningCareerTableViewBackground: UIView!
    @IBOutlet weak var careerName: UILabel!
    @IBOutlet weak var contestName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        awardWinningCareerTableViewBackground.layer.cornerRadius = 10
        awardWinningCareerTableViewBackground.layer.borderWidth = 1
        awardWinningCareerTableViewBackground.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
