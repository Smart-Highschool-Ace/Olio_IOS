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
    var count = 2
    var ccount = 0
    
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let strRange2 = strTest.index(strTest.startIndex, offsetBy: 2) ..< strTest.index(strTest.endIndex, offsetBy: -2)

        
        
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
    
    @IBAction func firstAuthenticationNumber(_ sender: Any) {
        
            
        
            sendString = String(Int(firstAuthenticationNumber.text!)!%10)
            
            print("카운트 : \(count)")
            print("sendString : \(sendString)") ///
        
        if count%2 == 0{
            
        
            switch count {
            case 2:
                secondAuthenticationNumber.text = sendString
                print("case 2")
                count += 1
                break
            case 3:
                thirdAuthenticationNumber.text = sendString
                print("case 3")
                count += 1
                break
            case 4:
                fourAuthenticationNumber.text = sendString
                print("case 4")
                count += 1
                break
            case 5:
                fiveAuthenticationNumber.text = sendString
                print("case 5")
                count += 1
                break
            case 6:
                sixAuthenticationNumber.text = sendString
                print("case 6")
                count += 1
                break
            default:
                break
            }
        }
        checkMaxLength(textField: firstAuthenticationNumber, maxLength: 1)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
  
        return true
    }
    
    //MARK: textfield MaxLength
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if (textField.text?.count ?? 0 > maxLength) {
            textField.deleteBackward()
        }
    }

}


//    print(firstAuthenticationNumber.text?[(firstAuthenticationNumber.text?.index(firstAuthenticationNumber.text!.endIndex, offsetBy: 1))!]) //
//    print(firstAuthenticationNumber.text?[(firstAuthenticationNumber.text?.index(before: firstAuthenticationNumber.text!.endIndex))!])
