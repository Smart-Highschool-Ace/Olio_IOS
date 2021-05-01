//
//  SignUpViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/11.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController{
    
    //MARK: Outlet var, let
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwardTextField: UITextField!
    @IBOutlet weak var passwardCheckTextField: UITextField!
    @IBOutlet weak var signIntopDecorations: UIImageView!
    @IBOutlet weak var signInDownDecorations: UIImageView!
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
    var currentTextfieldCount: Int = 1
    
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstAuthenticationNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        secondAuthenticationNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        thirdAuthenticationNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        fourAuthenticationNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        fiveAuthenticationNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        sixAuthenticationNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        firstAuthenticationNumber.becomeFirstResponder()
        
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
        
        SignIntopDecorationsSnapKit()
        SignInDownDecorationsSnapKit()
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
    
    @objc func textFieldDidChange(textField: UITextField) {
        
        if currentTextfieldCount < 6{
            currentTextfieldCount += 1
        }
        
     
        
            
            print("count : \(currentTextfieldCount)")
            
            switch currentTextfieldCount {
            case 2:
                secondAuthenticationNumber.becomeFirstResponder()
                break
            case 3:
                thirdAuthenticationNumber.becomeFirstResponder()
                break
            case 4:
                fourAuthenticationNumber.becomeFirstResponder()
                break
            case 5:
                fiveAuthenticationNumber.becomeFirstResponder()
                break
            case 6:
                sixAuthenticationNumber.becomeFirstResponder()
                break
            default:
                break
            }
        
        
    }
    
    //MARK: textfield MaxLength
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if (textField.text?.count ?? 0 > maxLength) {
            textField.deleteBackward()
        }
    }
    
    //MARK: SnapKit - TopDecoration
    func SignIntopDecorationsSnapKit(){
        signIntopDecorations.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(289)
        }
    }
    
    //MARK: SnapKit - DownDecoration
    func SignInDownDecorationsSnapKit(){
        signInDownDecorations.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview().offset(-60)
            make.height.equalTo(370)
        }
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let char = string.cString(using: String.Encoding.utf8){
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92{
                print("isBackSpace")
                print("currentTextfieldCount > \(currentTextfieldCount)")
                switch currentTextfieldCount      {
                case 2:
                    break
                case 3:
                    currentTextfieldCount -= 1
                    print("after currentTextfieldCount\(currentTextfieldCount)")
                    secondAuthenticationNumber.becomeFirstResponder()
                    break
                case 4:
                    currentTextfieldCount -= 1
                    print("after currentTextfieldCount\(currentTextfieldCount)")
                    thirdAuthenticationNumber.becomeFirstResponder()
                    break
                case 5:
                    currentTextfieldCount -= 1
                    print("after currentTextfieldCount\(currentTextfieldCount)")
                    fourAuthenticationNumber.becomeFirstResponder()
                    break
                case 6:
                    currentTextfieldCount -= 1
                    print("after currentTextfieldCount\(currentTextfieldCount)")
                    fiveAuthenticationNumber.becomeFirstResponder()
                    break
                default:
                    break
                }
                return true
            }
        }
        
        // 길이제한
        checkMaxLength(textField: textField, maxLength: 0)
        
        return true
    }
}

