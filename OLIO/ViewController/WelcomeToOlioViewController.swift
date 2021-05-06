//
//  WelcomeToOlioViewController.swift
//  OLIO
//
//  Created by 김유진 on 2021/03/11.
//

import UIKit
import SnapKit

class WelcomeToOlioViewController: UIViewController{
    
    //MARK: Outlet var, let
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var chooseSchoolTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var chooseSchoolButton: UIButton!
    @IBOutlet weak var schoolView: UIView!
    @IBOutlet weak var olioIntroTitle: UIImageView!
    @IBOutlet weak var nameTextFieldBackground: UIView!
    @IBOutlet weak var chooseSchoolTextFieldBackground: UIView!
    @IBOutlet weak var introductionTitle: UIImageView!
    @IBOutlet weak var introduceTextFieldBackground: UIView!
    
    
    let picker = UIImagePickerController()
    var isSeleted = false
    lazy var introduceTextView: UITextView = {
       var textView = UITextView()
        textView.text = "한줄소개를 입력해주세요"
        textView.backgroundColor = .clear
        textView.textColor = .lightGray
        return textView
    }()
    
    let ImageDisplayView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.white
        v.layer.shadowOpacity = 0.3
        v.layer.shadowOffset = CGSize(width: 0, height: 5)
        v.layer.masksToBounds = false
        return v
    }()
    
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextFieldBackground.layer.cornerRadius = 10
        chooseSchoolTextFieldBackground.layer.cornerRadius = 10
        introduceTextFieldBackground.layer.cornerRadius = 10
        
        self.view.addSubview(ImageDisplayView)
        
        nameTextFieldBackground.addSubview(nameTextField)
        chooseSchoolTextFieldBackground.addSubview(chooseSchoolTextField)
        chooseSchoolTextFieldBackground.addSubview(chooseSchoolButton)
        introduceTextFieldBackground.addSubview(introduceTextView)
        
        self.schoolView.center = CGPoint(x:187, y:600)
        
        schoolView.isHidden = true
        
        schoolView.layer.shadowOpacity = 0.3
        schoolView.layer.shadowOffset = CGSize(width: 0, height: 5)
        schoolView.layer.shadowRadius = 3
        schoolView.layer.masksToBounds = false
        schoolView.layer.cornerRadius = 10
        
        picker.delegate = self
        
        NameTextFieldSnapKit()
        ImageDisplayViewSnapKit()
        OlioIntroTitleSnapKit()
        IntroductionTitleSnapKit()
        NameTextFieldBackgroundSnapKit()
        ChooseSchoolTextFieldBackgroundSnapKit()
        IntroduceTextFieldBackgroundSnapKit()
    }
    
    @IBAction func modifyPicture(_ sender: Any) {
        let alert =  UIAlertController(title: "프로필 사진", message: "프로필 사진을 등록해주세요.", preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
        }
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
        self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func gwangjuSM(_ sender: Any) {
        chooseSchoolTextField.text = "광주소프트웨어마이스터고등학교"
        UIView.animate(withDuration: 0.3){
            self.schoolView.center = CGPoint(x:187, y:600)
            self.schoolView.isHidden = true
            self.chooseSchoolTextField.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        
        chooseSchoolButton.setImage(UIImage(named: "Olio_Down_Button"), for: .normal)
        isSeleted = false
    }
    
    @IBAction func daeduckSM(_ sender: Any) {
        chooseSchoolTextField.text = "대덕소프트웨어마이스터고등학교"
        UIView.animate(withDuration: 0.3){
            self.schoolView.center = CGPoint(x:187, y:600)
            self.schoolView.isHidden = true
            self.chooseSchoolTextField.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        
        chooseSchoolButton.setImage(UIImage(named: "Olio_Down_Button"), for: .normal)
        isSeleted = false
    }
    
    @IBAction func daeguSM(_ sender: Any) {
        chooseSchoolTextField.text = "대구소프트웨어마이스터고등학교"
        UIView.animate(withDuration: 0.3){
            self.schoolView.center = CGPoint(x:187, y:600)
            self.schoolView.isHidden = true
            self.chooseSchoolTextField.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        
        chooseSchoolButton.setImage(UIImage(named: "Olio_Down_Button"), for: .normal)
        isSeleted = false
    }
    
    //MARK: 프로필 사진 추가
    @IBAction func addPhotoButton(_ sender: Any) {

        let alert =  UIAlertController(title: "프로필 사진", message: "프로필 사진을 등록해주세요.", preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
        }
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
        self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: openLibrary
    func openLibrary(){
      picker.sourceType = .photoLibrary
      present(picker, animated: false, completion: nil)
    }

    //MARK: openCamera
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }else{
            print("Camera not available")
        }
    }
    
    @IBAction func chooseSchool(_ sender: Any) {
        if isSeleted == false{
            UIView.animate(withDuration: 0.3){
                self.schoolView.center = CGPoint(x:187, y:605)
                self.schoolView.isHidden = false
            }
            chooseSchoolTextField.textColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1)
            chooseSchoolButton.setImage(UIImage(named: "Olio_Up_Button"), for: .normal)
            isSeleted = true
        }else{
            UIView.animate(withDuration: 0.3){
                self.schoolView.center = CGPoint(x:187, y:600)
                self.schoolView.isHidden = true
            }
            chooseSchoolTextField.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
            chooseSchoolButton.setImage(UIImage(named: "Olio_Down_Button"), for: .normal)
            isSeleted = false
        }
        
    }

    
    //MARK: SnapKit - OlioIntroTitle
    func OlioIntroTitleSnapKit(){
        olioIntroTitle.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(ImageDisplayView.snp.top)
            make.height.equalTo(60)
            make.width.equalTo(207)
        }
    }
    
    func ImageDisplayViewSnapKit(){
        ImageDisplayView.snp.makeConstraints { (make) in
            make.bottom.equalTo(nameTextFieldBackground.snp.top)
            make.width.equalToSuperview().dividedBy(2.8)
            make.height.equalTo(ImageDisplayView.snp.width)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: SnapKit - NameTextFieldBackgroundSnapKit
    func NameTextFieldBackgroundSnapKit(){
        nameTextFieldBackground.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(35)
            make.width.equalToSuperview().dividedBy(1.7)
        }
    }
    
    //MARK: SnapKit - chooseSchoolTextFieldBackgroundSnapKit
    func ChooseSchoolTextFieldBackgroundSnapKit(){
        chooseSchoolTextFieldBackground.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameTextFieldBackground.snp.bottom)
            make.width.height.equalTo(nameTextFieldBackground)
        }
    }
    
    //MARK: SnapKit - NameTextFieldSnapKit
    func NameTextFieldSnapKit(){
        nameTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().inset(15)
            make.height.equalToSuperview().inset(5)
        }
    }
    
    //MARK: SnapKit - ChooseSchoolTextFieldSnapKit
    func ChooseSchoolTextFieldSnapKit(){
        chooseSchoolTextField.snp.makeConstraints { (make) in
        }
    }
    
    //MARK: SnapKit - ChooseSchoolButtonSnapKit
    func ChooseSchoolButtonSnapKit(){
        chooseSchoolButton.snp.makeConstraints { (make) in
        }
    }
    
    //MARK: SnapKit - IntroductionTitleSnapKit
    func IntroductionTitleSnapKit(){
        introductionTitle.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(chooseSchoolTextFieldBackground.snp.bottom)
            make.left.equalTo(chooseSchoolTextFieldBackground)
            make.height.equalTo(introductionTitle.snp.width).multipliedBy(4)
            make.width.equalToSuperview().dividedBy(7)
        }
    }
    
    //MARK: SnapKit - IntroduceTextFieldBackgroundSnapKit
    func IntroduceTextFieldBackgroundSnapKit(){
        introduceTextFieldBackground.snp.makeConstraints { (make) in
        }
    }
    
    //MARK: SnapKit - IntroduceTextViewSnapKit
    func IntroduceTextViewSnapKit(){
        introduceTextView.snp.makeConstraints { (make) in
        }
    }
    
    //MARK: SnapKit - NextButtonSnapKit
    func NextButtonSnapKit(){
        nextButton.snp.makeConstraints { (make) in
        }
    }
}

extension WelcomeToOlioViewController : UIImagePickerControllerDelegate,

UINavigationControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if (info[UIImagePickerController.InfoKey.originalImage] as? UIImage) != nil{
//            addPhotoButton.isHidden = true
//            profileImageView.isHidden = false
//            profileImageView.image = image
                 print(info)
             }
             dismiss(animated: true, completion: nil)
    }
}
