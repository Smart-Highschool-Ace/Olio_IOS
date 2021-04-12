//
//  ProjectCollectionViewCell.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/16.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var projectTitle: UILabel!
    @IBOutlet weak var ProjectShow: UIButton!
    @IBOutlet weak var projectShowCount: UILabel!
    @IBOutlet weak var projectIntroduce: UITextView!
    @IBOutlet weak var projectMember: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        projectImage.layer.cornerRadius = 13
    }

}
