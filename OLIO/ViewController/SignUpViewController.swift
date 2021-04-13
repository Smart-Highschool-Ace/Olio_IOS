//
//  SignUpViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/11.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate{
    
    //MARK: Outlet var, let
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwardTextField: UITextField!
    @IBOutlet weak var passwardCheckTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var haveAccount: UIButton!
    
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var firstAuthenticationNumber: UITextField!
    @IBOutlet weak var secondAuthenticationNumber: UITextField!
    @IBOutlet weak var thirdAuthenticationNumber: UITextField!
    @IBOutlet weak var fourAuthenticationNumber: UITextField!
    @IBOutlet weak var fiveAuthenticationNumber: UITextField!
    @IBOutlet weak var sixAuthenticationNumber: UITextField!
    
    //MARK: var, let
    var eachAuthenticationNumber = ["1"]
    var strTest = "안녕하십니까"
    var sendString = ""
    var count = 1
    var isfirstCount = 0
    var firstNum = ""
        
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstAuthenticationNumber.delegate = self
        secondAuthenticationNumber.delegate = self
        thirdAuthenticationNumber.delegate = self
        fourAuthenticationNumber.delegate = self
        fiveAuthenticationNumber.delegate = self
        sixAuthenticationNumber.delegate = self
        
        emailView.layer.shadowOpacity = 0.1
        emailView.layer.shadowOffset = CGSize(width: 0, height: 5)
        emailView.layer.shadowRadius = 10
        emailView.layer.masksToBounds = false
        emailView.layer.cornerRadius = 15
        
        emailView.center = CGPoint(x: 38+297/2, y: 196+420/2)
        
        emailView.isHidden = true
        
    }
    
    @IBAction func email(_ sender: Any) {
        emailView.isHidden = false
    }
    
    @IBAction func modifyEmail(_ sender: Any) {
        emailView.isHidden = true
    }
    
    //MARK: 이미 계정이 있으신가요?
    @IBAction func haveAccount(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("textField delegate entered")
        checkMaxLength(textField: firstAuthenticationNumber, maxLength: 1)
        return true
    }
    
    //MARK: textfield MaxLength
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if (textField.text?.count ?? 0 > maxLength) {
            textField.deleteBackward()
        }
    }

}
