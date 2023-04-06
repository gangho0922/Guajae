//
//  NickNameViewController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/04/04.
//

import UIKit
import SnapKit

class NickNameViewController: UIViewController {
    
    let authheadercustomview: UIView = {
        let authheadercustomview = AuthHeaderCustomView()
        authheadercustomview.sublabel.text = "사용하실 아이디를 입력해주세요."
        return authheadercustomview
    }()

    let sublabel: UILabel = {
        let sublabel = SubLabel()
        sublabel.text = "아이디는 최소 4자에서 최대 20자까지 가능합니다"
        return sublabel
    }()
    let textfield: UITextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "닉네임"
        return textfield
    }()
    let button: UIButton = {
        let button = CustomButton()
        button.setTitle("로그인", for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationItem.title = "회원가입"
        textfield.delegate = self
        addView()
        location()
        configNavigation()
    }
    
    @objc func nicknameviewcontroller() {
        let nicknameviewcontroller = CompleteViewController()
        navigationController?.pushViewController(
            nicknameviewcontroller,
            animated: true)
    }
    func addView() {
        self.view.addSubview(authheadercustomview)
        self.view.addSubview(sublabel)
        self.view.addSubview(textfield)
        self.view.addSubview(button)
    }
    func location() {
        sublabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(112)
        }
        textfield.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(sublabel.snp.bottom).inset(-28)
            make.height.equalTo(52)
        }
        button.snp.makeConstraints{ make in
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
extension NickNameViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let count = textField.text?.count, count >= 4 && count <= 20 {
            button.backgroundColor = UIColor(named: "ButtonColor")
            button.isUserInteractionEnabled = true
            button.addTarget(self, action: #selector(nicknameviewcontroller), for: .touchUpInside)
        }
        else{
            button.backgroundColor = UIColor(named: "NoCheckButtonColor")
            button.isUserInteractionEnabled = false
        }
    }
}
