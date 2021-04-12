//
//  PortfolioViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/16.
//

import UIKit

class PortfolioViewController: UIViewController{

    @IBOutlet weak var portfolioCollectionView: UICollectionView!
    @IBOutlet weak var selectedFilter: UIButton!
    @IBOutlet weak var unSelectedFilter: UIButton!
    
    var isSpread: Bool = false
    var currentFilter = "조회순"
    let sectionInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        unSelectedFilter.isHidden = true
        
        unSelectedFilter.setTitle("추천순", for: .normal)
        
        unSelectedFilter.layer.cornerRadius = 4
        unSelectedFilter.layer.masksToBounds = false
        unSelectedFilter.layer.shadowColor = UIColor.black.cgColor
        unSelectedFilter.layer.shadowOpacity = 0.5
        unSelectedFilter.layer.shadowOffset = CGSize(width: 0, height: 1)
        unSelectedFilter.layer.shadowRadius = 1
        
        portfolioCollectionView.delegate = self
        portfolioCollectionView.dataSource = self
    }
    
    @IBAction func unselectedFilter(_ sender: Any) {
        if currentFilter == "조회순"{
            selectedFilter.setImage(UIImage(named: "Olio_Filter_Recommend"), for: .normal)
            
            unSelectedFilter.center = CGPoint(x: 296+50/2, y: 50+20/2+3)
            UIView.animate(withDuration: 1){
                self.unSelectedFilter.isHidden = true
                self.unSelectedFilter.center = CGPoint(x: 296+50/2, y: 50+20/2)
            }
            
            isSpread = false
            currentFilter = "추천순"
            unSelectedFilter.setTitle("조회순", for: .normal)
            
        }else{ // 추천순
            selectedFilter.setImage(UIImage(named: "Olio_Filter_Button"), for: .normal)
            
            unSelectedFilter.center = CGPoint(x: 296+50/2, y: 50+20/2+3)
            UIView.animate(withDuration: 1){
                self.unSelectedFilter.isHidden = true
                self.unSelectedFilter.center = CGPoint(x: 296+50/2, y: 50+20/2)
            }
            
            isSpread = false
            currentFilter = "조회순"
            unSelectedFilter.setTitle("추천순", for: .normal)
        }
    }
    
    @IBAction func selectedFilter(_ sender: Any) {
        if isSpread == false { // 회색 버튼으로 변경
            if currentFilter == "조회순"{
                selectedFilter.setImage(UIImage(named: "Olio_Filter_See_IsSpread"), for: .normal)
            }else{ // 추천순
                selectedFilter.setImage(UIImage(named: "Olio_Filter_Recommend_isSpread"), for: .normal)
            }
            unSelectedFilter.isHidden = false
            isSpread = true
        }else{
            if currentFilter == "조회순"{
                
                selectedFilter.setImage(UIImage(named: "Olio_Filter_Button"), for: .normal)
            }else{
                selectedFilter.setImage(UIImage(named: "Olio_Filter_Recommend"), for: .normal)
            }
            
            unSelectedFilter.center = CGPoint(x: 296+50/2, y: 50+20/2+3)
            UIView.animate(withDuration: 1){
                self.unSelectedFilter.isHidden = true
                self.unSelectedFilter.center = CGPoint(x: 296+50/2, y: 50+20/2)
            }
            
            isSpread = false
        }
    }
}

extension PortfolioViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

            switch indexPath.row {

            case 0: self.performSegue(withIdentifier: "ProfileViewController", sender: nil)

            default:
                return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "portfolioCollectionViewCell", for: indexPath) as! PortfolioCollectionViewCell
        
        cell.PortfolioProfileImage.image = UIImage(named: "Olio_Portfolio_Profile_Image")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2.2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }

    //지정된 섹션의 셀 사이의 최소간격을 반환하는 메서드.
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        profileViewController.viewBeforeMoving = "portfolioCollectionView"
        
        self.navigationController?.pushViewController(profileViewController, animated: true)
        
    }
}
