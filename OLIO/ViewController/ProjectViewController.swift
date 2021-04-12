//
//  ProjectViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/16.
//

import UIKit

class ProjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var ProjectCollectionView: UICollectionView!
    @IBOutlet weak var selectedFilter: UIButton!
    @IBOutlet weak var unSelectedFilter: UIButton!
    
    let sectionInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    var isSpread: Bool = false
    var currentFilter = "조회순"
    
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
        
        ProjectCollectionView.delegate = self
        ProjectCollectionView.dataSource = self
        
    }
    @IBAction func unSelectedFilter(_ sender: Any) {
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCollectionViewCell", for: indexPath) as! ProjectCollectionViewCell
        
        cell.projectImage.image = UIImage(named: "Olio_Project_Image")
        cell.projectShowCount.text = "123"
        
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
}
