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
    @IBOutlet weak var checkDuplicates: UIButton!
    @IBOutlet weak var emailTitle: UIImageView!
    @IBOutlet weak var emailUnderLine: UIImageView!
    @IBOutlet weak var passwardCheckUnderLine: UIImageView!
    @IBOutlet weak var passwardUnderLine: UIImageView!
    @IBOutlet weak var signUpTitle: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwardTextField: UITextField!
    @IBOutlet weak var passwardCheckTextField: UITextField!
    @IBOutlet weak var signIntopDecorations: UIImageView!
    @IBOutlet weak var signInDownDecorations: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var haveAccount: UIButton!
    @IBOutlet weak var passwardTextFieldCondition: UILabel!
    
    lazy var signUpButtonTitle: UILabel = {
        var l = UILabel()
        l.text = "Sign up"
        l.textColor = .white
        l.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        return l
    }()
    
    //MARK: var, let
    var currentTextfieldCount: Int = 1
    
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.signUpButton.addSubview(signUpButtonTitle)
        
        SignIntopDecorationsSnapKit()
        SignInDownDecorationsSnapKit()
        SignUpTitleSnapKit()
        EmailTitleSnapKit()
        EmailTextFieldSnapKit()
        EmailUnderLineSnapKit()
        PasswrdTextFieldSnapKit()
        PasswardUnderLineSnapKit()
        PasswardTextFieldConditionSnpaKit()
        PasswardCheckTextFieldSnapKit()
        PasswardCheckUnderLineSnapKit()
        SignUpButtonSnapKit()
        signUpButtonTitleSnapKit()
        CheckDuplicatesSnapKit()
        haveAccountSnapKit()
    }
    
    @IBAction func CheckDuplicatesButton(_ sender: Any) {
        guard let bottomView = storyboard?.instantiateViewController(withIdentifier: "CheckDuplicatesViewCotroller")
                else { return }
        
        addChild(bottomView)
        self.view.addSubview(bottomView.view)
    }
    
    //MARK: 이미 계정이 있으신가요?
    @IBAction func haveAccount(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: haveAccount
    func haveAccountSnapKit(){
        haveAccount.snp.makeConstraints { (make) in
            make.right.equalTo(signUpButton)
            make.top.equalTo(signUpButton.snp.bottom).offset(50)
            make.width.equalTo(116)
            make.height.equalTo(12)
        }
    }
    
    //MARK: checkDuplicates
    func CheckDuplicatesSnapKit(){
        checkDuplicates.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(50)
            make.width.equalTo(50)
            make.height.equalTo(20)
            make.bottom.equalTo(emailTitle.snp.top)
        }
    }
    
    //MARK: SnapKit - SignInTitle
    func signUpButtonTitleSnapKit(){
        signUpButtonTitle.snp.makeConstraints { (make) in            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(12)
        }
    }
    
    //MARK: SnapKit - SignUpButton
    func SignUpButtonSnapKit(){
        signUpButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(43)
            make.top.equalTo(passwardCheckUnderLine.snp.bottom).offset(50)
            make.height.equalTo(51)
        }
    }
    
    //MARK: SnapKit - passwardCheckUnderLine
    func PasswardCheckUnderLineSnapKit(){
        passwardCheckUnderLine.snp.makeConstraints { (make) in
            make.top.equalTo(passwardCheckTextField.snp.bottom)
            make.left.equalTo(passwardUnderLine.snp.left)
            make.width.equalTo(passwardUnderLine)
            make.height.equalTo(4)
        }
    }
    
    //MARK: SnapKit - passwardCheckTextField
    func PasswardCheckTextFieldSnapKit(){
        passwardCheckTextField.snp.makeConstraints { (make) in
            make.top.equalTo(passwardTextFieldCondition.snp.bottom).offset(30)
            make.left.equalTo(passwardTextFieldCondition)
            make.width.equalTo(passwardUnderLine)
            make.height.equalTo(31)
        }
    }
    
    //MARK: SnapKit - passwardTextFieldCondition
    func PasswardTextFieldConditionSnpaKit(){
        passwardTextFieldCondition.snp.makeConstraints { (make) in
            make.left.equalTo(emailUnderLine)
            make.width.equalToSuperview()
            make.height.equalTo(12)
            make.top.equalTo(passwardUnderLine.snp.bottom)
        }
    }
    
    //MARK: SnapKit - PasswardTextField
    func PasswrdTextFieldSnapKit(){
        passwardTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailUnderLine.snp.bottom).offset(30)
            make.width.equalTo(emailUnderLine)
            make.height.equalTo(31)
            make.left.equalTo(emailUnderLine)
        }
    }
    
    //MARK: SnapKit - PasswardUnderLine
    func PasswardUnderLineSnapKit(){
        passwardUnderLine.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.left.equalTo(emailUnderLine.snp.left)
            make.width.equalTo(emailUnderLine)
            make.height.equalTo(4)
            make.top.equalTo(passwardTextField.snp.bottom)
        }
    }
    
    //MARK: SnapKit - EmailUnderLine
    func EmailUnderLineSnapKit(){
        emailUnderLine.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom)
            make.left.equalTo(emailTitle)
            make.width.equalTo(emailTextField)
            make.height.equalTo(4)
        }
    }
    
    //MARK: SnapKit - EmailTextField
    func EmailTextFieldSnapKit(){
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTitle.snp.bottom)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(50)
            make.height.equalTo(31)
        }
    }
    
    //MARK: SnapKit - EmailTitle
    func EmailTitleSnapKit(){
        emailTitle.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-80)
            make.width.equalTo(37)
            make.height.equalTo(20)
            make.left.equalToSuperview().offset(50)
        }
    }
    
    //MARK: SnapKit - SignUpTitle
    func SignUpTitleSnapKit(){
        signUpTitle.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(180)
            make.height.equalToSuperview().dividedBy(23)
            make.width.equalToSuperview().dividedBy(5)
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

