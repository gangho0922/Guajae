//
//  SignPasswordViewController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/04/03.
//

import UIKit
import SnapKit

class SignPasswordViewController: UIViewController {
   
    
    var firsteyeButton = UIButton(type : .custom)
    
    var secondeyeButton = UIButton(type : .custom)
    
    var isSecurePassword = true
    
    let mainlabel: UILabel = {
        let mainlabel = UILabel()
        mainlabel.text = "Dotori"
        mainlabel.textColor = .black
        mainlabel.font = UIFont.boldSystemFont(ofSize: 32)
        return mainlabel
    }()
    let dotoriimageview: UIImageView = {
        let DI = UIImageView()
        DI.image = UIImage(named: "Dotori_Icon")
        
        return DI
    }()
    let sublabel: UILabel = {
        let sublabel = UILabel()
        sublabel.text = "사용하실 아이디를 입력해주세요."
        sublabel.textColor = .black
        sublabel.font = .systemFont(ofSize: 16)
        return sublabel
    }()
    let belowlabel: UILabel = {
        let belowlabel = UILabel()
        belowlabel.text = "비밀번호는 최소 8자에서 최대 40자까지 가능합니다."
        belowlabel.textColor = .black
        belowlabel.font = .systemFont(ofSize: 12)
        return belowlabel
    }()
    let passwordfirtextfield: UITextField = {
        let passwordfirtextfield = UITextField()
        passwordfirtextfield.backgroundColor = .white
        passwordfirtextfield.layer.borderColor = UIColor.black.cgColor
        passwordfirtextfield.layer.borderWidth = 1.0
        passwordfirtextfield.layer.cornerRadius = 8
        passwordfirtextfield.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        passwordfirtextfield.leftViewMode = .always
        passwordfirtextfield.placeholder = "로그인"
        return passwordfirtextfield
    }()
    let passwordsectextfield: UITextField = {
        let passwordsectextfield = UITextField()
        passwordsectextfield.backgroundColor = .white
        passwordsectextfield.layer.borderColor = UIColor.black.cgColor
        passwordsectextfield.layer.borderWidth = 1.0
        passwordsectextfield.layer.cornerRadius = 8
        passwordsectextfield.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        passwordsectextfield.leftViewMode = .always
        passwordsectextfield.placeholder = "비밀번호"
        return passwordsectextfield
    }()
    let passwordbutton: UIButton = {
        let passwordbutton = UIButton()
        passwordbutton.setTitle("다음", for: .normal)
        passwordbutton.setTitleColor(.white, for: .normal)
        passwordbutton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        passwordbutton.backgroundColor = UIColor(named: "NoCheckButtonColor")
        passwordbutton.layer.cornerRadius = 8
        return passwordbutton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "회원가입"
        passwordfirtextfield.delegate = self
        passwordsectextfield.delegate = self
        addview()
        location()
        firstshownpassword()
        secshownpassword()
        configNavigation()
        firsteyeButton.addTarget(self, action: #selector(firsteyeButtonDidTap(_:)), for: .touchUpInside)
        secondeyeButton.addTarget(self, action: #selector(secondeyeButtonDidTap(_:)), for: .touchUpInside)
    }
    
    @objc func signpasswordviewcontroller() {
        let signpasswordviewcontroller = NickNameViewController()
        navigationController?.pushViewController(signpasswordviewcontroller, animated: true)
    }
    
    func firstshownpassword(){
        firsteyeButton = .init()
        passwordfirtextfield.isSecureTextEntry = isSecurePassword
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        self.firsteyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye" : "eye.fill"), for: .normal)
        self.firsteyeButton.configuration = buttonConfiguration

        self.passwordfirtextfield.rightView = firsteyeButton
        
        self.passwordfirtextfield.rightViewMode = .always
    }
    
    func secshownpassword(){
        secondeyeButton = .init()
        passwordsectextfield.isSecureTextEntry = isSecurePassword
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        self.secondeyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye" : "eye.fill"), for: .normal)
        self.secondeyeButton.configuration = buttonConfiguration

        self.passwordsectextfield.rightView = secondeyeButton
        
        self.passwordsectextfield.rightViewMode = .always
    }
    
    @objc func firsteyeButtonDidTap(_ sender: UIButton) {
        isSecurePassword.toggle()
        self.firsteyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye" : "eye.fill"), for: .normal)
        passwordfirtextfield.isSecureTextEntry = isSecurePassword
    }
    @objc func secondeyeButtonDidTap(_ sender: UIButton) {
        isSecurePassword.toggle()
        self.secondeyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye" : "eye.fill"), for: .normal)
        passwordsectextfield.isSecureTextEntry = isSecurePassword
    }
    
    
    func addview() {
        self.view.addSubview(dotoriimageview)
        self.view.addSubview(mainlabel)
        self.view.addSubview(sublabel)
        self.view.addSubview(belowlabel)
        self.view.addSubview(passwordfirtextfield)
        self.view.addSubview(passwordsectextfield)
        self.view.addSubview(passwordbutton)
    }
    func location() {
        dotoriimageview.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(view.safeAreaInsets).offset(121)
            make.height.equalTo(48)
            make.width.equalTo(48)
        }
        mainlabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(85)
            make.top.equalTo(view.safeAreaInsets).offset(131)
            make.height.equalTo(26)
        }
        sublabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(mainlabel.snp.bottom).inset(-20)
            make.height.equalTo(26)
        }
        belowlabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(sublabel.snp.bottom).inset(0)
            make.height.equalTo(26)
        }
        passwordfirtextfield.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(belowlabel.snp.bottom).inset(-28)
            make.height.equalTo(52)
        }
        passwordsectextfield.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(passwordfirtextfield.snp.bottom).inset(-24)
            make.height.equalTo(52)
        }
        passwordbutton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(52)
        }
    }
    func configNavigation() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.tintColor = .black
        self.navigationItem.backBarButtonItem = backButton
    }
}
extension SignPasswordViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if passwordfirtextfield.text == passwordsectextfield.text {
            if let count = passwordfirtextfield.text?.count, count <= 40 && count >= 8 {
                passwordbutton.backgroundColor = UIColor(named: "ButtonColor")
                passwordbutton.isUserInteractionEnabled = true
                passwordbutton.addTarget(self, action: #selector(signpasswordviewcontroller), for: .touchUpInside)
            }
        }
        else{
            passwordbutton.backgroundColor = UIColor(named: "NoCheckButtonColor")
            passwordbutton.isUserInteractionEnabled = false
        }
    }
}
