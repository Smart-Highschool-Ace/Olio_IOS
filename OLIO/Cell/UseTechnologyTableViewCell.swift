//
//  UseTechnologyTableViewCell.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/29.
//

import UIKit

class UseTechnologyTableViewCell: UITableViewCell{
    
    @IBOutlet weak var technologyProficiencyPercent: UILabel!
    @IBOutlet weak var technologyName: UILabel!
    @IBOutlet weak var technologyLogo: UIImageView!
    @IBOutlet weak var technologyProficiencyBackground: UIView!
    @IBOutlet weak var technologyProficiency: UIView!
    
    var timer:Timer?
    var timeStart = 0
    
    override func awakeFromNib() {
        technologyProficiencyBackground.layer.cornerRadius = 5
        technologyProficiency.layer.cornerRadius = 5
        
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
        UIView.animate(withDuration: 2) {
            self.technologyProficiencyPercent.center = CGPoint(x: 80, y: 26)
            self.technologyProficiency.frame.size.width = CGFloat(240)
        }    }
    
    @objc func onTimerFires()
    {
        timeStart += 1
        technologyProficiencyPercent.text = "\(timeStart)%"
        if timeStart >= 50 {
            print("ENDENDEND")
            timer?.invalidate()
            timer = nil
        }
    }
    
    func technologyProficiency(count: Int){
        switch count {
        case 10:
//            onTimerFires(count: 10)
            technologyProficiencyPercentAnimation(barWidth: 24, LabelX: 48)
            
            break
        case 20:
//            onTimerFires(count: 20)
            technologyProficiencyPercentAnimation(barWidth: 48, LabelX: 48)
            break
        case 30:
//            onTimerFires(count: 30)
            technologyProficiencyPercentAnimation(barWidth: 72, LabelX: 48)
            break
        case 40:
//            onTimerFires(count: 40)
            technologyProficiencyPercentAnimation(barWidth: 24, LabelX: 48)
            break
        case 50:
//            onTimerFires(count: 50)
            technologyProficiencyPercentAnimation(barWidth: 24, LabelX: 48)
            break
        case 60:
//            onTimerFires(count: 60)
            technologyProficiencyPercentAnimation(barWidth: 24, LabelX: 48)
            break
        case 70:
//            onTimerFires(count: 70)
            technologyProficiencyPercentAnimation(barWidth: 24, LabelX: 48)
            break
        case 80:
//            onTimerFires(count: 80)
            technologyProficiencyPercentAnimation(barWidth: 24, LabelX: 48)
            break
        case 90:
//            onTimerFires(count: 90)
            technologyProficiencyPercentAnimation(barWidth: 24, LabelX: 48)
            break
        case 100:
//            onTimerFires(count: 100)
            technologyProficiencyPercentAnimation(barWidth: 240, LabelX: 48)
            break
        default:
            break
        }
    }
    
    func technologyProficiencyPercentAnimation(barWidth: Int, LabelX: Int){
        

        UIView.animate(withDuration: 2) {
            self.technologyProficiencyPercent.center = CGPoint(x: LabelX, y: 26)
            self.technologyProficiency.frame.size.width = CGFloat(barWidth)
        }
    }
}
