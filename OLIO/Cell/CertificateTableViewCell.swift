//
//  CertificateTableViewCell.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/30.
//

import UIKit

class CertificateTableViewCell: UITableViewCell {

    @IBOutlet weak var certificateBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        certificateBackground.layer.cornerRadius = 10
        certificateBackground.layer.borderColor = UIColor.lightGray.cgColor
        certificateBackground.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
