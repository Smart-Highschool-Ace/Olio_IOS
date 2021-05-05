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
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var introduceTextView: UITextView!
    @IBOutlet weak var chooseSchoolLabel: UILabel!
    @IBOutlet weak var chooseSchool: UIButton!
    @IBOutlet weak var schoolView: UIView!
    @IBOutlet weak var olioIntroTitle: UIImageView!
    @IBOutlet weak var nameTextFieldBackground: UIImageView!
    
    
    let picker = UIImagePickerController()
    var isSeleted = false
    
    lazy var signUpButtonTitle: UILabel = {
        var l = UILabel()
        l.text = "Sign up"
        l.textColor = .white
        l.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        return l
    }()
    
    let imageDisplayView: UIView = {
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
        
        // Add UIView as a Subview
        self.view.addSubview(imageDisplayView)
        
        nameTextFieldBackground.addSubview(nameTextField)
        
        self.schoolView.center = CGPoint(x:187, y:600)
        
        schoolView.isHidden = true
        
        schoolView.layer.shadowOpacity = 0.3
        schoolView.layer.shadowOffset = CGSize(width: 0, height: 5)
        schoolView.layer.shadowRadius = 3
        schoolView.layer.masksToBounds = false
        schoolView.layer.cornerRadius = 10
        
        picker.delegate = self
        
        OlioIntroTitleSnapKit()
        imageDisplayViewSnapKit()
        NameTextFieldBackgroundSnapKit()
        NameTextFieldSnapKit()
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
        chooseSchoolLabel.text = "광주소프트웨어마이스터고등학교"
        UIView.animate(withDuration: 0.3){
            self.schoolView.center = CGPoint(x:187, y:600)
            self.schoolView.isHidden = true
            self.chooseSchoolLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        
        chooseSchool.setImage(UIImage(named: "Olio_Down_Button"), for: .normal)
        isSeleted = false
    }
    
    @IBAction func daeduckSM(_ sender: Any) {
        chooseSchoolLabel.text = "대덕소프트웨어마이스터고등학교"
        UIView.animate(withDuration: 0.3){
            self.schoolView.center = CGPoint(x:187, y:600)
            self.schoolView.isHidden = true
            self.chooseSchoolLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        
        chooseSchool.setImage(UIImage(named: "Olio_Down_Button"), for: .normal)
        isSeleted = false
    }
    
    @IBAction func daeguSM(_ sender: Any) {
        chooseSchoolLabel.text = "대구소프트웨어마이스터고등학교"
        UIView.animate(withDuration: 0.3){
            self.schoolView.center = CGPoint(x:187, y:600)
            self.schoolView.isHidden = true
            self.chooseSchoolLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        
        chooseSchool.setImage(UIImage(named: "Olio_Down_Button"), for: .normal)
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
            chooseSchoolLabel.textColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1)
            chooseSchool.setImage(UIImage(named: "Olio_Up_Button"), for: .normal)
            isSeleted = true
        }else{
            UIView.animate(withDuration: 0.3){
                self.schoolView.center = CGPoint(x:187, y:600)
                self.schoolView.isHidden = true
            }
            chooseSchoolLabel.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
            chooseSchool.setImage(UIImage(named: "Olio_Down_Button"), for: .normal)
            isSeleted = false
        }
        
    }
    
    //MARK: SnapKit - EmailTextFieldBackground
    func NameTextFieldBackgroundSnapKit(){
        nameTextFieldBackground.snp.makeConstraints { (make) in
            make.top.equalTo(imageDisplayView.snp.bottom).offset(50)
            make.width.equalToSuperview().dividedBy(1.5)
            make.centerX.equalToSuperview()
            make.height.equalTo(38)
        }
    }
    
    //MARK: SnapKit - OlioIntroTitle
    func OlioIntroTitleSnapKit(){
        olioIntroTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(160)
            make.centerX.equalToSuperview()
            make.width.equalTo(207)
            make.height.equalTo(60)
        }
    }
    
    func imageDisplayViewSnapKit(){
        imageDisplayView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(olioIntroTitle.snp.bottom).offset(50)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(imageDisplayView.snp.width)
        }
    }
    
    func NameTextFieldSnapKit(){
        nameTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.height.equalToSuperview()
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
