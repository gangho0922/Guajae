//
//  SignPasswordViewController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/04/03.
//

import UIKit
import SnapKit

class SignPasswordViewController: UIViewController {
   
    let authheadercustomview: UIView = {
        let authheadercustomview = AuthHeaderCustomView()
        authheadercustomview.sublabel.text = "사용하실 아이디를 입력해주세요."
        return authheadercustomview
    }()

    let sublabel: UILabel = {
        let sublabel = SubLabel()
        sublabel.text = "비밀번호는 최소 8자에서 최대 40자까지 가능합니다"
        return sublabel
    }()
    let passwordfirtextfield: UITextField = {
        let passwordfirtextfield = CustomTextField()
        passwordfirtextfield.placeholder = "비밀번호"
        return passwordfirtextfield
    }()
    let passwordsectextfield: UITextField = {
        let passwordsectextfield = CustomTextField()
        passwordsectextfield.placeholder = "비밀번호 재입력"
        return passwordsectextfield
    }()
    let passwordbutton: UIButton = {
        let passwordbutton = CustomButton()
        passwordbutton.setTitle("다음", for: .normal)
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
        addtarget()
    }
    
    @objc func signpasswordviewcontroller() {
        let signpasswordviewcontroller = NickNameViewController()
        navigationController?.pushViewController(signpasswordviewcontroller, animated: true)
    }
    
    func addtarget() {
        firsteyeButton.addTarget(self,
                                 action: #selector(firsteyeButtonDidTap(_:)),
                                 for: .touchUpInside)
        secondeyeButton.addTarget(self,
                                  action: #selector(secondeyeButtonDidTap(_:)),
                                  for: .touchUpInside)
    }
    
    var firsteyeButton = UIButton(type : .custom)
    
    var secondeyeButton = UIButton(type : .custom)
    
    var isSecurePassword = true
    
    func firstshownpassword(){
        firsteyeButton = .init()
        passwordfirtextfield.isSecureTextEntry = isSecurePassword
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        self.firsteyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye.fill" : "eye.slash.fill")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
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
        self.secondeyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye.fill" : "eye.slash.fill")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
        self.secondeyeButton.configuration = buttonConfiguration

        self.passwordsectextfield.rightView = secondeyeButton
        
        self.passwordsectextfield.rightViewMode = .always
    }
    
    @objc func firsteyeButtonDidTap(_ sender: UIButton) {
        isSecurePassword.toggle()
        self.firsteyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye.fill" : "eye.slash.fill")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
        passwordfirtextfield.isSecureTextEntry = isSecurePassword
    }
    @objc func secondeyeButtonDidTap(_ sender: UIButton) {
        isSecurePassword.toggle()
        self.secondeyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye.fill" : "eye.slash.fill")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
        passwordsectextfield.isSecureTextEntry = isSecurePassword
    }
    
    
    func addview() {
        self.view.addSubview(authheadercustomview)
        self.view.addSubview(sublabel)
        self.view.addSubview(passwordfirtextfield)
        self.view.addSubview(passwordsectextfield)
        self.view.addSubview(passwordbutton)
    }
    func location() {
        sublabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(112)
        }
        passwordfirtextfield.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(sublabel.snp.bottom).inset(-28)
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
