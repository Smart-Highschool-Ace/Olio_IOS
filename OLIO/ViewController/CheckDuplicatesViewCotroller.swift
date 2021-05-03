//
//  CheckDuplicatesViewCotroller.swift
//  OLIO
//
//  Created by 김유진 on 2021/05/03.
//

import UIKit

class CheckDuplicatesViewCotroller: UIViewController{
    @IBOutlet weak var firstAuthenticationNumber: UITextField!
    @IBOutlet weak var secondAuthenticationNumber: UITextField!
    @IBOutlet weak var thirdAuthenticationNumber: UITextField!
    @IBOutlet weak var fourAuthenticationNumber: UITextField!
    @IBOutlet weak var fiveAuthenticationNumber: UITextField!
    @IBOutlet weak var sixAuthenticationNumber: UITextField!
    @IBOutlet weak var emailView: UIView!
    
    var currentTextfieldCount: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailView.layer.shadowOpacity = 0.1
        emailView.layer.shadowOffset = CGSize(width: 0, height: 5)
        emailView.layer.shadowRadius = 10
        emailView.layer.masksToBounds = false
        emailView.layer.cornerRadius = 15
        
        firstAuthenticationNumber.delegate = self
        secondAuthenticationNumber.delegate = self
        thirdAuthenticationNumber.delegate = self
        fourAuthenticationNumber.delegate = self
        fiveAuthenticationNumber.delegate = self
        sixAuthenticationNumber.delegate = self
        
        firstAuthenticationNumber.becomeFirstResponder()
        
        firstAuthenticationNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        secondAuthenticationNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        thirdAuthenticationNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        fourAuthenticationNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        fiveAuthenticationNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        sixAuthenticationNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    @IBAction func emailModify(_ sender: Any) {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
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
    
    
}

extension CheckDuplicatesViewCotroller: UITextFieldDelegate {
    
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
    
    //MARK: textfield MaxLength
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if (textField.text?.count ?? 0 > maxLength) {
            textField.deleteBackward()
        }
    }
}
