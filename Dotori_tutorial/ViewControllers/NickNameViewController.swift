//
//  NickNameViewController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/04/04.
//

import UIKit
import SnapKit

class NickNameViewController: UIViewController {
    
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
        belowlabel.text = "비밀번호는 최소 4자에서 최대 20자까지 가능합니다."
        belowlabel.textColor = .black
        belowlabel.font = .systemFont(ofSize: 12)
        return belowlabel
    }()
    let textfield: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.layer.borderWidth = 1.0
        textfield.layer.cornerRadius = 8
        textfield.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textfield.leftViewMode = .always
        textfield.placeholder = "닉네임"
        return textfield
    }()
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.backgroundColor = UIColor(named: "NoCheckButtonColor")
        button.layer.cornerRadius = 8
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
        navigationController?.pushViewController(nicknameviewcontroller, animated: true)
    }
    func addView() {
        self.view.addSubview(dotoriimageview)
        self.view.addSubview(mainlabel)
        self.view.addSubview(sublabel)
        self.view.addSubview(belowlabel)
        self.view.addSubview(textfield)
        self.view.addSubview(button)
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
        textfield.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(belowlabel.snp.bottom).inset(-28)
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
