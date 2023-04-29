//
//  SignUpViewController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/03/28.
//
import UIKit
import SnapKit
class SignUpViewController: UIViewController {
    
    let authheadercustomview = AuthHeaderCustomView(description: "사용하실 아이디를 입력해주세요.")

    let sublabel = SubLabel(description: "아이디는 최소 4자에서 최대 20자까지 가능합니다")
    
    let idTextfield: UITextField = {
        let idTextfield = CustomTextField()
        idTextfield.placeholder = "아이디"
        return idTextfield
    }()
    let idbutton: UIButton = {
        let idbutton = CustomButton()
        idbutton.setTitle("다음", for: .normal)
        return idbutton
    }()
    ///각 버튼과 라벨 등의 커스텀 부분
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idTextfield.delegate = self
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = "회원가입"
        view.backgroundColor = .white
        addView()
        ///전체 addSubView함수
        location()
        ///전체 위치 선정 함수
        configNavigation()
    }
    func addView() {
        self.view.addSubview(authheadercustomview)
        self.view.addSubview(sublabel)
        self.view.addSubview(idTextfield)
        self.view.addSubview(idbutton)
    }
    
    @objc func idButtonDidTap(){
        let signupviewcontroller = SignPasswordViewController()
        navigationController?.pushViewController(
            signupviewcontroller,
            animated: true
        )
    }
    
    ///addSubView 정리본
    
    func location() {
        idTextfield.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(sublabel.snp.bottom).inset(-28)
            make.height.equalTo(52)
        }
        idbutton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(52)
        }
    }
    ///위치 설정 정리본
    
    func configNavigation() {
        let backButton = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
        backButton.tintColor = .black
        self.navigationItem.backBarButtonItem = backButton
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let count = idTextfield.text?.count, count >= 4 && count <= 20 {
            idbutton.backgroundColor = UIColor(named: "ButtonColor")
            idbutton.isUserInteractionEnabled = true
            idbutton.addTarget(
                self,
                action: #selector(idButtonDidTap),
                for: .touchUpInside
            )
        }
        else{
            idbutton.backgroundColor = UIColor(named: "NoCheckButtonColor")
            idbutton.isUserInteractionEnabled = false
        }
    }
}

