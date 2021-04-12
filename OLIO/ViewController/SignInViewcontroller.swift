//
//  SignInViewcontroller.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/09.
//

import UIKit

class SignInViewcontroller: UIViewController{
    
    //MARK: Outlet var, let
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwardTextField: UITextField!
    
    @IBOutlet weak var idStoreButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var noAccountButton: UIButton!
    
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: 로그인 Button
    @IBAction func signInButton(_ sender: Any) {
        
    }
    
}
