//
//  DescriptionViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/08.
//

import UIKit

var currentView: String = ""

class DescriptionViewController: UIViewController{
    
    //MARK: Outlet
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var firstPageController: UIImageView!
    @IBOutlet weak var secondPageController: UIImageView!
    @IBOutlet weak var thirdPageController: UIImageView!
    @IBOutlet weak var DescriptionImage: UIImageView!
    @IBOutlet weak var DescriptionText: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentView = "firstView"
        nextButton.isHidden = true
        print(currentView)
        // 한 손가락 스와이프 제스쳐 등록(왼쪽, 오른쪽)
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(DescriptionViewController.respondToSwipeGesture(_:)))
                swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
                self.view.addGestureRecognizer(swipeLeft)
                
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(DescriptionViewController.respondToSwipeGesture(_:)))
                swipeRight.direction = UISwipeGestureRecognizer.Direction.right
                self.view.addGestureRecognizer(swipeRight)
    }
    
    //MARK: respondToSwipeGesture
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.left :
                    if currentView == "firstView" {
                        self.DescriptionText.image = UIImage(named: "Olio_Second_Description_Text")
                        self.DescriptionText.center = CGPoint(x: 205, y: 515)
                        self.DescriptionText.alpha = 0.4
                        
                        UIView.animate(withDuration: 0.5){
                            // Image Change
                            self.DescriptionImage.alpha = 0.6
                            self.DescriptionImage.image = UIImage(named:"Olio_Second_Description")
                            self.DescriptionImage.alpha = 1
                            
                            // Text Change
                            self.DescriptionText.center = CGPoint(x: 185, y: 515)
                            self.DescriptionText.alpha = 1
                            
                            // Page Controller Change
                            self.firstPageController.image = UIImage(named: "Olio_Unselected_View")
                            self.secondPageController.image = UIImage(named: "Olio_Current_View")
                            self.skipButton.isHidden = false
                        }
                        currentView = "secondView"
                        print(currentView)
                    }else if currentView == "secondView"{
                        self.DescriptionText.image = UIImage(named: "Olio_Third_Description_Text")
                        self.DescriptionText.center = CGPoint(x: 205, y: 515)
                        self.DescriptionText.alpha = 0.4
                        self.DescriptionImage.alpha = 0.6
                        self.nextButton.isHidden = false
                        self.nextButton.alpha = 0.3
                        UIView.animate(withDuration: 0.5){
                            self.DescriptionImage.image = UIImage(named:"Olio_Third_Description")
                            self.DescriptionImage.alpha = 1
                            
                            // Text Change
                            self.DescriptionText.center = CGPoint(x: 185, y: 515)
                            self.DescriptionText.alpha = 1
                            
                            // Page Controller Change
                            self.firstPageController.image = UIImage(named: "Olio_Unselected_View")
                            self.secondPageController.image = UIImage(named: "Olio_Unselected_View")
                            self.thirdPageController.image = UIImage(named: "Olio_Current_View")
                            self.nextButton.alpha = 1
                            self.skipButton.isHidden = true
                        }
                        currentView = "thirdView"
                        print(currentView)
                    }
                case UISwipeGestureRecognizer.Direction.right :
                    if currentView == "secondView"{
                        self.DescriptionText.image = UIImage(named: "Olio_First_Description_Text")
                        self.DescriptionText.center = CGPoint(x: 205, y: 515)
                        self.DescriptionText.alpha = 0.4
                        UIView.animate(withDuration: 0.5){
                            // Image Change
                            self.DescriptionImage.alpha = 0.6
                            self.DescriptionImage.image = UIImage(named:"Olio_First_Description")
                            self.DescriptionImage.alpha = 1
                            
                            // Text Change
                            self.DescriptionText.center = CGPoint(x: 185, y: 515)
                            self.DescriptionText.alpha = 1
                            
                            // Page Controller Change
                            self.firstPageController.image = UIImage(named: "Olio_Current_View")
                            self.secondPageController.image = UIImage(named: "Olio_Unselected_View")
                            self.skipButton.isHidden = false
                        }
                        currentView = "firstView"
                    }else if currentView == "thirdView"{
                        self.DescriptionText.image = UIImage(named: "Olio_Second_Description_Text")
                        self.DescriptionText.center = CGPoint(x: 205, y: 515)
                        self.DescriptionText.alpha = 0.4
                        self.DescriptionImage.alpha = 0.6
                        self.nextButton.isHidden = true
                        self.nextButton.alpha = 0
                        UIView.animate(withDuration: 0.5){
                            self.DescriptionImage.image = UIImage(named:"Olio_Second_Description")
                            self.DescriptionImage.alpha = 1
                            
                            // Text Change
                            self.DescriptionText.center = CGPoint(x: 185, y: 515)
                            self.DescriptionText.alpha = 1
                            
                            // Page Controller Change
                            self.firstPageController.image = UIImage(named: "Olio_Unselected_View")
                            self.secondPageController.image = UIImage(named: "Olio_Current_View")
                            self.thirdPageController.image = UIImage(named: "Olio_Unselected_View")
                            self.skipButton.isHidden = false
                            self.nextButton.alpha = 1
                        }
                        currentView = "secondView"
                    }else{
                        UIView.animate(withDuration: 0.5){
                        }
                    }
                    print("right")
                default:
                    break
            }
        }
    }
}
