//
//  DescriptionViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/08.
//

import UIKit
import SnapKit

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
        
        // 요소 휴대폰 별 위치 잡기
        DescriptionImageSnapKit()
        DescriptionTextSnapKit()
        DescriptionsecondPageController()
        DescriptionFirstPagecontroller()
        DescriptionThirdPagecontroller()
        DescriptionNextButton()
        DescriptionSkip()
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
    
    func DescriptionSkip(){
        skipButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            make.right.equalToSuperview().inset(18)
            make.height.equalTo(16)
            make.width.equalTo(35)
        }
    }
    
    func DescriptionImageSnapKit(){
        DescriptionImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-70)
            make.width.equalTo(166)
            make.height.equalTo(149)
        }
    }
    
    func DescriptionTextSnapKit(){
        DescriptionText.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(DescriptionImage.snp.bottom).offset(30)
            make.width.equalTo(250)
            make.height.equalTo(86)
        }
    }
    
    func DescriptionsecondPageController(){
        secondPageController.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(DescriptionText.snp.bottom).offset(50)
            make.width.height.equalTo(10)
        }
    }
    
    func DescriptionFirstPagecontroller(){
        firstPageController.snp.makeConstraints { (make) in
            make.right.equalTo(secondPageController.snp.left).offset(-10)
            make.centerY.equalTo(secondPageController)
            make.width.height.equalTo(10)
        }
    }
    
    func DescriptionThirdPagecontroller(){
        thirdPageController.snp.makeConstraints { (make) in
            make.left.equalTo(secondPageController.snp.right).offset(10)
            make.centerY.equalTo(secondPageController)
            make.width.height.equalTo(10)
        }
    }
    
    func DescriptionNextButton(){
        nextButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).inset(30)
            make.right.equalToSuperview().inset(30)
            make.width.height.equalTo(74)
        }
    }
}
