//
//  ProfileViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/17.
//

import UIKit

class ProfileViewController: UIViewController{
    
    @IBOutlet weak var star: UIButton!
    @IBOutlet weak var starCount: UILabel!
    @IBOutlet weak var project: UIButton!
    @IBOutlet weak var awardWinningCareer: UIButton!
    @IBOutlet weak var certificate: UIButton!
    @IBOutlet weak var useTechnology: UIButton!
    @IBOutlet weak var scrollView: UIView!
    @IBOutlet weak var ProfilePhoto: UIImageView!
    @IBOutlet weak var modificationFollow: UIButton!
    @IBOutlet weak var name: UILabel!
    
    //MARK: var, let
    var currnetColor = "gray"
    var selectedLabel = "useTechnology"
    var viewBeforeMoving = ""
    var isFollowed = false
    
    //MARK: VC calling
    let useTechnologyVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "useTechnology")
    
    let awardWinningCareerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "awardWinningCareer")
    
    let projectVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "project")
    
    let certificateVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "certificate")
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 프로필 버튼을 클릭했을 때
        if viewBeforeMoving == "MainViewController"{
            ProfilePhoto.image = UIImage(named: "Olio_Profile_Photo_YeWon")
            modificationFollow.setImage(UIImage(named: "Olio_Profile_Modify"), for: .normal)
            name.text = "3219 진예원"
        } // Portfolio에서 클릭했을 때
        else if viewBeforeMoving == "portfolioCollectionView"{
            ProfilePhoto.image = UIImage(named: "Olio_Profile_Photo_DaeHun")
            modificationFollow.setImage(UIImage(named: "Olio_Follow_Button"), for: .normal)
            name.text = "3114 이대훈"
        }
        
        selectedLabel = "useTechnology"
            
        useTechnologyVC.view.frame = CGRect(x: 0, y: 390, width: 375, height: 303)

        useTechnologyVC.willMove(toParent: self)
        self.addChild(useTechnologyVC)
        useTechnologyVC.didMove(toParent: self)
        scrollView.addSubview(useTechnologyVC.view)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(DescriptionViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        print("viewBeforeMoving : \(viewBeforeMoving)")
    }
    
    @IBAction func olioLogo(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: respondToSwipeGesture
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                self.navigationController?.popViewController(animated: true)
            default: break
                
            }
        }
    }
    
    @IBAction func userLink(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "https://www.notion.so/daehun")! as URL)
    }
    
    @IBAction func modificationFollow(_ sender: Any) {
        if viewBeforeMoving == "MainViewController"{
        }
        else if viewBeforeMoving == "portfolioCollectionView"{
            if isFollowed == false{ // 팔로우 버튼
                modificationFollow.setImage(UIImage(named: "Olio_Follow_Cancle"), for: .normal)
                isFollowed = true
            }else{ // 팔로우 취소 버튼
                modificationFollow.setImage(UIImage(named: "Olio_Follow_Button"), for: .normal)
                isFollowed = false
            }
        }
    }
    @IBAction func star(_ sender: Any) {
        if currnetColor == "gray"
        {
            star.setImage(UIImage(named: "Olio_Yellow_Star"), for: .normal)
            starCount.textColor = UIColor(red: 239/255, green: 225/255, blue: 99/255, alpha: 1)
            currnetColor = "Yellow"
        }else{
            star.setImage(UIImage(named: "Olio_Gray_Star"), for: .normal)
            starCount.textColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
            currnetColor = "gray"
        }

    }
    
    //MARK: 사용기술
    @IBAction func useTechnology(_ sender: Any) {
        if selectedLabel != "useTechnology"{
            selectedLabel(label: useTechnology)
            selectedLabel = "useTechnology"
            unSelectedOtherLabel(label1: awardWinningCareer, label2: project, label3: certificate)
            
            
            useTechnologyVC.view.frame = CGRect(x: 0, y: 390, width: 375, height: 303)

            useTechnologyVC.willMove(toParent: self)
            self.addChild(useTechnologyVC)
            useTechnologyVC.didMove(toParent: self)
            scrollView.addSubview(useTechnologyVC.view)
        }
    }
    
    //MARK: 프로젝트
    @IBAction func project(_ sender: Any) {
        if selectedLabel != "project"{
            selectedLabel(label: project)
            selectedLabel = "project"
            unSelectedOtherLabel(label1: awardWinningCareer, label2: useTechnology, label3: certificate)
            
            projectVC.view.frame = CGRect(x: 0, y: 390, width: 375, height: 303)

            projectVC.willMove(toParent: self)
            self.addChild(projectVC)
            projectVC.didMove(toParent: self)
            scrollView.addSubview(projectVC.view)
        }
    }
    
    //MARK: 수상경력
    @IBAction func awardWinningCareer(_ sender: Any) {
        if selectedLabel != "awardWinningCareer"{
            selectedLabel(label: awardWinningCareer)
            selectedLabel = "awardWinningCareer"
            unSelectedOtherLabel(label1: certificate, label2: project, label3: useTechnology)
            
            awardWinningCareerVC.view.frame = CGRect(x: 0, y: 390, width: 375, height: 303)

            awardWinningCareerVC.willMove(toParent: self)
            self.addChild(awardWinningCareerVC)
            awardWinningCareerVC.didMove(toParent: self)
            scrollView.addSubview(awardWinningCareerVC.view)
        }
    }
    
    //MARK: 자격증
    @IBAction func certificate(_ sender: Any) {
        if selectedLabel != "certificate"{
            selectedLabel(label: certificate)
            selectedLabel = "certificate"
            unSelectedOtherLabel(label1: awardWinningCareer, label2: project, label3: useTechnology)
            
            certificateVC.view.frame = CGRect(x: 0, y: 390, width: 375, height: 303)

            certificateVC.willMove(toParent: self)
            self.addChild(certificateVC)
            certificateVC.didMove(toParent: self)
            scrollView.addSubview(certificateVC.view)
        }
    }
    
    func unSelectedOtherLabel(label1: UIButton, label2: UIButton, label3: UIButton){
        label1.setTitleColor(UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1), for: .normal)
        label1.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        label2.setTitleColor(UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1), for: .normal)
        label2.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        label3.setTitleColor(UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1), for: .normal)
        label3.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    }
    
    func selectedLabel(label: UIButton){
        label.setTitleColor(.black, for: .normal)
        label.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    }
    
    
}
