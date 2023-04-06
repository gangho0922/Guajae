//
//  ViewController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/03/27.
//
import UIKit
import SnapKit
class ViewController: UIViewController {
    
    ///각 버튼과 라벨 등의 커스텀 부분 및 타겟 지정
    let authheadercustomview: UIView = {
        let authheadercustomview = AuthHeaderCustomView()
        authheadercustomview.sublabel.text = "더 편한 기숙사 생활을 위해"
        return authheadercustomview
    }()
    let loginfirtextfield: UITextField = {
        let loginfirtextfield = CustomTextField()
        loginfirtextfield.placeholder = "로그인"
        return loginfirtextfield
    }()
    let loginsectextfield: UITextField = {
        let loginsectextfield = CustomTextField()
        loginsectextfield.placeholder = "비밀번호"
        return loginsectextfield
    }()
    
    let seekidbutton: UIButton = {
        let seekidbutton = UIButton()
        seekidbutton.setTitle("아이디 찾기", for: .normal)
        seekidbutton.setTitleColor(.systemGray, for: .normal)
        seekidbutton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        return seekidbutton
    }()
    let stickLabel: UILabel = {
        let stickLabel = UILabel()
        stickLabel.text = "|"
        stickLabel.textColor = .systemGray
        return stickLabel
    }()
    let RePasswordbutton: UIButton = {
        let RePasswordbutton = UIButton()
        RePasswordbutton.setTitle("비밀번호 재설정", for: .normal)
        RePasswordbutton.setTitleColor(.systemGray, for: .normal)
        RePasswordbutton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        return RePasswordbutton
    }()
    
    let signinbutton: UIButton = {
        let signinbutton = UIButton()
        let attributedString = NSMutableAttributedString(string: "아직 회원이 아니신가요? 회원가입")
        attributedString.addAttribute(.underlineStyle, value: [], range: NSRange(location: 14, length: 4))
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 14, length: 4))
        signinbutton.setAttributedTitle(attributedString, for: .normal)
        signinbutton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        signinbutton.setTitleColor(.systemGray, for: .normal)
        
        return signinbutton
    }()
    let loginbutton: UIButton = {
        let loginbutton = CustomButton()
        loginbutton.setTitle("로그인", for: .normal)
        return loginbutton
    }()
    let firststackView: UIStackView = {
        let firststackView = UIStackView()
        firststackView.axis = .horizontal
        firststackView.alignment = .center
        firststackView.spacing = 10
        firststackView.translatesAutoresizingMaskIntoConstraints = false
        return firststackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginfirtextfield.delegate = self
        loginsectextfield.delegate = self
        self.navigationItem.title = "로그인"
        self.view.backgroundColor = .white
        ///전체 addSubView 함수
        addView()
        ///전체 위치 설정 함수
        location()
        ///안보이게 버튼 커스텀
        ShownPassword()
        ///navigationbar 커스텀
        configNavigation()
        ///addtarget 모음
        addtarget()
    }
    ///set 활용 전환 방법
    @objc func secondscreen() {
        let SEC = HomeViewController()
        navigationController?.setViewControllers(
            [SEC],
            animated: true
        )
    }
    ///push 활용 전환 방법
    @objc func signupscreen() {
        let GOSIGNUP = SignUpViewController()
        navigationController?.pushViewController(
            GOSIGNUP,
            animated: true
        )
    }
    ///present방식 화면 덜 덮는 방법
    @objc func presentViewController() {
        let Seek = SeekViewController()
        Seek.modalTransitionStyle = .coverVertical
        self.present(
            Seek,
            animated: true,
            completion: nil
        )
    }
    ///present방식 화면 다 덮는 방법
    @objc func seeViewController() {
        let ID = IDViewController()
        ID.modalPresentationStyle = .fullScreen
        self.present(
            ID,
            animated: true,
            completion: nil
        )
    }
    
    func addtarget(){
        eyeButton.addTarget(self,
                            action: #selector(eyeButtonDidTap(_:)),
                            for: .touchUpInside)
        signinbutton.addTarget(self,
                               action: #selector(signupscreen),
                               for: .touchUpInside)
        seekidbutton.addTarget(self,
                               action: #selector(presentViewController),
                               for: .touchUpInside)
        RePasswordbutton.addTarget(self,
                                   action: #selector(seeViewController),
                                   for: .touchUpInside)
    }
    ///비밀번호 안보이거나 보이게 하는 부분

    var eyeButton = UIButton(type : .custom)
    
    var isSecurePassword = true
    
    func ShownPassword(){
        eyeButton = .init()
        loginsectextfield.isSecureTextEntry = isSecurePassword
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        self.eyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye.fill" : "eye.slash.fill")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
        self.eyeButton.configuration = buttonConfiguration

        self.loginsectextfield.rightView = eyeButton
        
        self.loginsectextfield.rightViewMode = .always
    }
    
    @objc func eyeButtonDidTap(_ sender: UIButton) {
        isSecurePassword.toggle()
        self.eyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye.fill" : "eye.slash.fill")?.withTintColor(.systemGray    , renderingMode: .alwaysOriginal), for: .normal)
        loginsectextfield.isSecureTextEntry = isSecurePassword
    }
    ///addsubview 정리본
    func addView() {
        self.view.addSubview(authheadercustomview)
        self.view.addSubview(loginfirtextfield)
        self.view.addSubview(loginsectextfield)
        self.view.addSubview(seekidbutton)
        self.view.addSubview(RePasswordbutton)
        self.view.addSubview(signinbutton)
        self.view.addSubview(loginbutton)
        self.view.addSubview(firststackView)
        firststackView.addArrangedSubview(seekidbutton)
        firststackView.addArrangedSubview(stickLabel)
        firststackView.addArrangedSubview(RePasswordbutton)
    }
    ///위치 설정 정리본
    func location() {
        
        
        loginfirtextfield.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(166)
            make.height.equalTo(52)
        }
        loginsectextfield.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(loginfirtextfield.snp.bottom).inset(-24)
            make.height.equalTo(52)
        }
        firststackView.snp.makeConstraints{ make in
            make.leading.equalTo(195)
            make.top.equalTo(loginsectextfield.snp.bottom).offset(24)
        }
        signinbutton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(loginbutton.snp.top).inset(-36)
        }
        loginbutton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(52)
        }
    }
    ///navigationbar 커스텀
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
///button change event
extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == loginfirtextfield {
            if loginfirtextfield.text?.count == 0 || loginsectextfield.text?.count == 0 {
                loginbutton.backgroundColor = UIColor(named: "NoCheckButtonColor")
                loginbutton.isUserInteractionEnabled = false
            }
            else{
                loginbutton.backgroundColor = UIColor(named: "ButtonColor")
                loginbutton.isUserInteractionEnabled = true
                loginbutton.addTarget(
                    self,
                    action: #selector(secondscreen),
                    for: .touchUpInside
                )
            }
        }
        else if textField == loginsectextfield {
            if loginfirtextfield.text?.count == 0 || loginsectextfield.text?.count == 0 {
                loginbutton.backgroundColor = UIColor(named: "NoCheckButtonColor")
                loginbutton.isUserInteractionEnabled = false
            }
            else{
                loginbutton.backgroundColor = UIColor(named: "ButtonColor")
                loginbutton.isUserInteractionEnabled = true
                loginbutton.addTarget(
                    self,
                    action: #selector(secondscreen),
                    for: .touchUpInside
                )
            }
        }
    }
}
