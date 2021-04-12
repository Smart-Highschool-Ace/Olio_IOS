//
//  MainViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/16.
//

import UIKit

class MainViewController: UIViewController{
    
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var ProjectImageView: UIImageView!
    @IBOutlet weak var PortfolioImageView: UIImageView!
    
    let PortfolioVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: " ProjectViewController")
    
    let ProjectVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PortfolioViewController")
    var currentView = "Portfolio"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeButton.center = CGPoint(x:181, y:211.8)
        
        self.PortfolioVC.view.frame = CGRect(x: 0, y: 218, width: 375, height: 594)
        self.addChild(self.PortfolioVC)
        self.view.addSubview(self.PortfolioVC.view)
        self.PortfolioVC.didMove(toParent: self)
    }
    
    @IBAction func profileButton(_ sender: Any) {
        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        profileViewController.viewBeforeMoving = "MainViewController"
        
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @IBAction func changeButton(_ sender: Any) {
                if self.currentView == "Portfolio"{
                    UIView.animate(withDuration: 0.3){
                        self.changeButton.center = CGPoint(x:192, y:211.8)
                        
                        self.currentView = "Project"
                    }
                    // 화면전환
                    self.ProjectVC.view.frame = CGRect(x: 0, y: 222, width: 375, height: 594)
                    self.addChild(self.ProjectVC)
                    self.view.addSubview(self.ProjectVC.view)
                    self.ProjectVC.didMove(toParent: self)
                    
                    PortfolioImageView.image = UIImage(named:"Olio_White_Portfolio")
                    ProjectImageView.image = UIImage(named: "Olio_Green_Project")
                    print("currentView > \(currentView)")
                    
                }else if self.currentView == "Project"{
                    UIView.animate(withDuration: 0.3){
                        self.changeButton.center = CGPoint(x:181, y:211.8)
                        
                        self.currentView = "Portfolio"
                    }
                    // 화면전환
                    self.PortfolioVC.view.frame = CGRect(x: 0, y: 222, width: 375, height: 594)
                    self.addChild(self.PortfolioVC)
                    self.view.addSubview(self.PortfolioVC.view)
                    self.PortfolioVC.didMove(toParent: self)
                    
                    PortfolioImageView.image = UIImage(named:"Olio_Green_Portfolio")
                    ProjectImageView.image = UIImage(named: "Olio_White_Project")
                    print("currentView > \(currentView)")
                }
    }
}
