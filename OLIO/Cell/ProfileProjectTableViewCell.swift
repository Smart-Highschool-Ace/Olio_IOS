//
//  ProfileProjectTableViewCell.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/29.
//

import UIKit

class ProfileProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var projectLogo: UIImageView!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectContent: UILabel!
    @IBOutlet weak var projectBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        projectBackground.layer.cornerRadius = 10
        projectBackground.layer.borderWidth = 1
        projectBackground.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
