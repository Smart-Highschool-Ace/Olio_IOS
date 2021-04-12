//
//  FindIdPasswardViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/22.
//

import UIKit

class FindIdPasswardViewController: UIViewController{
    
    @IBOutlet weak var findbackGroundView: UIView!
    @IBOutlet weak var findId: UIButton!
    @IBOutlet weak var findPassward: UIButton!
    @IBOutlet weak var findIdView: UIView!
    @IBOutlet weak var findShowId: UIButton!
    @IBOutlet weak var findShowPassward: UIButton!
    @IBOutlet weak var findPasswardView: UIView!
    @IBOutlet weak var findIdPwPhoto: UIImageView!
    @IBOutlet weak var showIdPwView: UIView!
    @IBOutlet weak var IdPwTextView: UITextView!
    @IBOutlet weak var goLogin: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var isSelected = "Id"
    var currentView = "find"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goLogin.layer.cornerRadius = 5
        
        findbackGroundView.layer.borderWidth = 1
        findbackGroundView.layer.borderColor = CGColor(red: 90/255, green: 148/255, blue: 139/255, alpha: 1)
        findbackGroundView.layer.cornerRadius = 10
        findbackGroundView.backgroundColor = UIColor.white
        
        selected(button: findId)
        unSelected(button: findPassward)
        
        showIdPwView.isHidden = true
        
        isSelected = "Id"
        currentView = "find"
        
        findShowId.layer.cornerRadius = 5
        findShowPassward.layer.cornerRadius = 5
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func findId(_ sender: Any) {
       
        if isSelected != "Id"{
            selected(button: findId)
            unSelected(button: findPassward)
            isSelected = "Id"
            currentView = "find"
        }
        
        if currentView == "find"{
            findIdPwPhoto.image = UIImage(named: "Olio_Find_Photo")
            showIdPwView.isHidden = true
        }
        
        UIView.animate(withDuration: 0.5){
            self.findPasswardView.center = CGPoint(x: 470, y: 236+299/2)
            self.findIdView.center = CGPoint(x: 325/2, y: 236+299/2)
        }
    }
    
    @IBAction func findPassward(_ sender: Any) {
        
        if isSelected != "Passward"{
            selected(button: findPassward)
            unSelected(button: findId)
            isSelected = "Passward"
            findIdPwPhoto.image = UIImage(named: "Olio_Find_Photo")
            currentView = "find"
        }
        
        if currentView == "find"{
            findIdPwPhoto.image = UIImage(named: "Olio_Find_Photo")
            showIdPwView.isHidden = true
        }
        
        UIView.animate(withDuration: 0.5){
            self.findIdView.center = CGPoint(x: -400, y: 236+299/2)
            self.findPasswardView.center = CGPoint(x: 325/2, y: 236+299/2)
        }
    }
    
    @IBAction func findShowId(_ sender: Any) {
        if currentView == "find"{
            findIdPwPhoto.image = UIImage(named: "Olio_Find_Show_Photo")
            showIdPwView.isHidden = false
            currentView = "show"
        }
        
        showIdPwView.isHidden = false
    }
    
    @IBAction func findShowPassward(_ sender: Any) {
        if currentView == "find"{
            findIdPwPhoto.image = UIImage(named: "Olio_Find_Show_Photo")
            showIdPwView.isHidden = false
            currentView = "show"
        }
        
        showIdPwView.isHidden = false
    }
    
    @IBAction func goLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        findIdView.isHidden = true
    }
    
    func selected(button: UIButton) {
        button.layer.borderWidth = 0
        button.backgroundColor = UIColor(red: 90/255, green: 148/255, blue: 139/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 18
    }

    func unSelected(button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 90/255, green: 148/255, blue: 139/255, alpha: 1)
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor(red: 90/255, green: 148/255, blue: 139/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = 18
    }
}


