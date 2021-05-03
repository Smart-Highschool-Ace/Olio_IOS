//
//  SignInViewcontroller.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/09.
//

import UIKit

class SignInViewcontroller: UIViewController{
    
    //MARK: Outlet var, let
    @IBOutlet weak var signInTitle: UIImageView!
    @IBOutlet weak var emailUnderLine: UIImageView!
    @IBOutlet weak var passwardUnderLine: UIImageView!
    @IBOutlet weak var signIntopDecorations: UIImageView!
    @IBOutlet weak var signInDownDecorations: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwardTextField: UITextField!
    @IBOutlet weak var emailTitle: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var noAccountButton: UIButton!
    @IBOutlet weak var idSaveLabel: UIImageView!
    @IBOutlet weak var findIdPassward: UIButton!
    
    lazy var idSaveButton: UIButton = {
        var b = UIButton()
        b.layer.borderWidth = 1
        b.layer.borderColor = CGColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        b.layer.cornerRadius = 5
        return b
    }()
    
    lazy var signInButtonTitle: UILabel = {
        var l = UILabel()
        l.text = "Sign in"
        l.textColor = .white
        l.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        return l
    }()
    
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(idSaveButton)
        self.signInButton.addSubview(signInButtonTitle)
        
        SignIntopDecorationsSnapKit()
        SignInDownDecorationsSnapKit()
        EmailUnderLineSnapKit()
        EmailTextFieldSnapKit()
        EmailTitleSnapKit()
        PasswardUnderLineSnapKit()
        PasswrdTextFieldSnapKit()
        IdSaveButtonSnapKit()
        IdSaveLabelSnapKit()
        FindIdPasswardSnapKit()
        SignInButtonSnapKit()
        SignInButtonTitleSnapKit()
        NoAccountButtonSnapKit()
        SignInTitleSnapKit()
    }
    
    //MARK: SignIn Button
    @IBAction func signInButton(_ sender: Any) {
    }
    
    //MARK: SnapKit - MoveToSignUpButton
    func NoAccountButtonSnapKit(){
        noAccountButton.snp.makeConstraints { (make) in
            make.left.equalTo(signInButton.snp.left)
            make.width.equalTo(116)
            make.height.equalTo(12)
            make.top.equalTo(signInButton.snp.bottom).offset(50)
        }
    }
    
    //MARK: SnapKit - SignInButtonTitle
    func SignInButtonTitleSnapKit(){
        signInButtonTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(signInButton)
            make.top.equalToSuperview().inset(12)
        }
    }
    
    //MARK: SnapKit - SignInButton
    func SignInButtonSnapKit(){
        signInButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(43)
            make.top.equalTo(findIdPassward.snp.bottom).offset(50)
            make.height.equalTo(51)
        }
    }
    
    //MARK: SnapKit - SignInTitle
    func SignInTitleSnapKit(){
        signInTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview().dividedBy(5)
            make.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().offset(180)
            make.height.equalToSuperview().dividedBy(23)
        }
    }
    
    //MARK: SnapKit - Decoration
    func SignIntopDecorationsSnapKit(){
        signIntopDecorations.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(289)
        }
    }
    
    func SignInDownDecorationsSnapKit(){
        signInDownDecorations.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(370)
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
    
    //MARK: Snapkit - EmailTextField
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
    
    //MARK: SnapKit - PasswardTextField
    func PasswrdTextFieldSnapKit(){
        passwardTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailUnderLine.snp.bottom).offset(30)
            make.width.equalTo(passwardUnderLine)
            make.height.equalTo(31)
            make.left.equalTo(passwardUnderLine)
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
    
    //MARK: SnapKit - IdSaveButton
    func IdSaveButtonSnapKit(){
        idSaveButton.snp.makeConstraints { (make) in
            make.left.equalTo(passwardUnderLine)
            make.width.height.equalTo(16)
            make.top.equalTo(passwardUnderLine.snp.bottom).offset(6)
        }
    }
    
    //MARK: SnapKit - IdSaveLabel
    func IdSaveLabelSnapKit(){
        idSaveLabel.snp.makeConstraints { (make) in
            make.top.equalTo(idSaveButton.snp.top)
            make.left.equalTo(idSaveButton.snp.right).offset(6)
            make.width.equalTo(56)
            make.height.equalTo(16)
        }
    }
    
    //MARK: SnapKit - findIdPassward
    func FindIdPasswardSnapKit(){
        findIdPassward.snp.makeConstraints { (make) in
            make.top.equalTo(idSaveButton.snp.bottom).offset(20)
            make.left.equalTo(idSaveButton)
            make.width.equalTo(84)
            make.height.equalTo(24)
        }
    }
}
