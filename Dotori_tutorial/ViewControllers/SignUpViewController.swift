//
//  SignUpViewController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/03/28.
//
import UIKit
import SnapKit
class SignUpViewController: UIViewController {
    
    let loginmainlabel: UILabel = {
        let loginmainlabel = UILabel()
        loginmainlabel.text = "Dotori"
        loginmainlabel.textColor = .black
        loginmainlabel.font = UIFont.boldSystemFont(ofSize: 32)
        return loginmainlabel
    }()
    let dotoriimageview: UIImageView = {
        let DI = UIImageView()
        DI.image = UIImage(named: "Dotori_Icon")
        
        return DI
    }()
    let loginsublabel: UILabel = {
        let loginsublabel = UILabel()
        loginsublabel.text = "사용하실 아이디를 입력해주세요."
        loginsublabel.textColor = .black
        loginsublabel.font = .systemFont(ofSize: 16)
        return loginsublabel
    }()
    let loginbelowlabel: UILabel = {
        let loginbelowlabel = UILabel()
        loginbelowlabel.text = "아이디는 최소 4자에서 최대 20자까지 가능합니다."
        loginbelowlabel.textColor = .black
        loginbelowlabel.font = .systemFont(ofSize: 12)
        return loginbelowlabel
    }()
    let idTextfield: UITextField = {
        let idTextfield = UITextField()
        idTextfield.backgroundColor = .white
        idTextfield.layer.borderColor = UIColor.black.cgColor
        idTextfield.layer.borderWidth = 1.0
        idTextfield.layer.cornerRadius = 8
        idTextfield.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        idTextfield.leftViewMode = .always
        idTextfield.placeholder = "로그인"
        return idTextfield
    }()
    let idbutton: UIButton = {
        let idbutton = UIButton()
        idbutton.setTitle("로그인", for: .normal)
        idbutton.setTitleColor(.white, for: .normal)
        idbutton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        idbutton.backgroundColor = UIColor(named: "NoCheckButtonColor")
        idbutton.layer.cornerRadius = 8
        return idbutton
    }()
    //각 버튼과 라벨 등의 커스텀 부분
    
    @objc func gotonextscreen(){
        let gotonextscreen = SignPasswordViewController()
        navigationController?.pushViewController(gotonextscreen, animated: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idTextfield.delegate = self
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = "회원가입"
        view.backgroundColor = .white
        addView()
        //전체 addSubView함수
        location()
        //전체 위치 선정 함수
    }
    func addView() {
        self.view.addSubview(dotoriimageview)
        self.view.addSubview(loginmainlabel)
        self.view.addSubview(loginsublabel)
        self.view.addSubview(loginbelowlabel)
        self.view.addSubview(idTextfield)
        self.view.addSubview(idbutton)
    }
    //addSubView 정리본
    
    
    
    
    func location() {
        dotoriimageview.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(view.safeAreaInsets).offset(121)
            make.height.equalTo(48)
            make.width.equalTo(48)
        }
        loginmainlabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(85)
            make.top.equalTo(view.safeAreaInsets).offset(131)
            make.height.equalTo(26)
        }
        loginsublabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(loginmainlabel.snp.bottom).inset(-20)
            make.height.equalTo(26)
        }
        loginbelowlabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(loginsublabel.snp.bottom).inset(0)
            make.height.equalTo(26)
        }
        idTextfield.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(loginbelowlabel.snp.bottom).inset(-28)
            make.height.equalTo(52)
        }
        idbutton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(view.safeAreaInsets).inset(24)
            make.height.equalTo(52)
        }
    }
    //위치 설정 정리본
}
extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let count = idTextfield.text?.count, count >= 4 && count <= 20 {
            idbutton.backgroundColor = UIColor(named: "ButtonColor")
            idbutton.isUserInteractionEnabled = true
            idbutton.addTarget(self, action: #selector(gotonextscreen), for: .touchUpInside)
        }
        else{
            idbutton.backgroundColor = UIColor(named: "NoCheckButtonColor")
            idbutton.isUserInteractionEnabled = false
        }
    }
}

