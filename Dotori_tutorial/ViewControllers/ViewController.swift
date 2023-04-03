//
//  ViewController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/03/27.
//
import UIKit
import SnapKit
class ViewController: UIViewController {
    
    var eyeButton = UIButton(type : .custom)
    
    var isSecurePassword = true
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginfirtextfield.delegate = self
        loginsectextfield.delegate = self
        self.navigationItem.title = "로그인"
        self.view.backgroundColor = .white
        addView()
        //전체 addSubView 함수
        location()
        //전체 위치 설정 함수
        ShownPassword()
        //안보이게 버튼 커스텀
        eyeButton.addTarget(self, action: #selector(eyeButtonDidTap(_:)), for: .touchUpInside)
        // 안보이게 버튼을 활성화하기 위해 selector로 eyeButtonDidTap 지정
        secondstackView.addArrangedSubview(nocustomerlabel)
        secondstackView.addArrangedSubview(signinbutton)
        firststackView.addArrangedSubview(seekidbutton)
        firststackView.addArrangedSubview(stickLabel)
        firststackView.addArrangedSubview(RePasswordbutton)
    }
    /// asdsda
    @objc func secondscreen() {
        let SEC = HomeViewController()
        navigationController?.setViewControllers([SEC], animated: true)
    }
    //set 활용 전환 방법
    @objc func signupscreen() {
        let GOSIGNUP = SignUpViewController()
        navigationController?.pushViewController(GOSIGNUP, animated: true)
        self.navigationItem.title = ""
    }
    //push 활용 전환 방법
    @objc func presentViewController() {
        let Seek = SeekViewController()
        Seek.modalTransitionStyle = .coverVertical
        self.present(Seek, animated: true, completion: nil)
    }
    //present방식 화면 덜 덮는 방법
    @objc func seeViewController() {
        let ID = IDViewController()
        ID.modalPresentationStyle = .fullScreen
        self.present(ID, animated: true, completion: nil)
    }
    //present방식 화면 다 덮는 방법
    
    
    
    
    
    func ShownPassword(){
        eyeButton = .init()
        loginsectextfield.isSecureTextEntry = isSecurePassword
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        self.eyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye" : "eye.fill"), for: .normal)
        self.eyeButton.configuration = buttonConfiguration

        self.loginsectextfield.rightView = eyeButton
        
        self.loginsectextfield.rightViewMode = .always
    }
    
    @objc func eyeButtonDidTap(_ sender: UIButton) {
        isSecurePassword.toggle()
        self.eyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye" : "eye.fill"), for: .normal)
        loginsectextfield.isSecureTextEntry = isSecurePassword
    }
    //비밀번호 안보이거나 보이게 하는 부분
    
    // MARK: - Properties
    
    let dotoriimageview: UIImageView = {
        let DI = UIImageView()
        DI.image = UIImage(named: "Dotori_Icon")
        
        return DI
    }()
    let loginmainlabel: UILabel = {
        let loginmainlabel = UILabel()
        loginmainlabel.text = "Dotori"
        loginmainlabel.textColor = .black
        loginmainlabel.font = UIFont.boldSystemFont(ofSize: 32)
        return loginmainlabel
    }()
    let loginsublabel: UILabel = {
        let loginsublabel = UILabel()
        loginsublabel.text = "더 편한 기숙사 생활을 위해"
        loginsublabel.textColor = .black
        loginsublabel.font = .systemFont(ofSize: 16)
        return loginsublabel
    }()
    let loginfirtextfield: UITextField = {
        let loginfirtextfield = UITextField()
        loginfirtextfield.backgroundColor = .white
        loginfirtextfield.layer.borderColor = UIColor.black.cgColor
        loginfirtextfield.layer.borderWidth = 1.0
        loginfirtextfield.layer.cornerRadius = 8
        loginfirtextfield.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        loginfirtextfield.leftViewMode = .always
        loginfirtextfield.placeholder = "로그인"
        return loginfirtextfield
    }()
    let loginsectextfield: UITextField = {
        let loginsectextfield = UITextField()
        loginsectextfield.backgroundColor = .white
        loginsectextfield.layer.borderColor = UIColor.black.cgColor
        loginsectextfield.layer.borderWidth = 1.0
        loginsectextfield.layer.cornerRadius = 8
        loginsectextfield.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        loginsectextfield.leftViewMode = .always
        loginsectextfield.placeholder = "비밀번호"
        return loginsectextfield
    }()
    
    let seekidbutton: UIButton = {
        let seekidbutton = UIButton()
        seekidbutton.setTitle("아이디 찾기", for: .normal)
        seekidbutton.setTitleColor(.systemGray, for: .normal)
        seekidbutton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        seekidbutton.addTarget(target, action: #selector(presentViewController), for: .touchUpInside)
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
        RePasswordbutton.addTarget(target, action: #selector(seeViewController), for: .touchUpInside)
        return RePasswordbutton
    }()
    
    let nocustomerlabel: UILabel = {
        let nocustomerlabel = UILabel()
        nocustomerlabel.text = "아직 회원이 아니신가요?"
        nocustomerlabel.textColor = .systemGray
        nocustomerlabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        return nocustomerlabel
    }()
    let signinbutton: UIButton = {
        let signinbutton = UIButton()
        signinbutton.setTitle("회원가입", for: .normal)
        signinbutton.setTitleColor(.black, for: .normal)
        signinbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
        signinbutton.addTarget(target, action: #selector(signupscreen), for: .touchUpInside)
        return signinbutton
    }()
    let loginbutton: UIButton = {
        let loginbutton = UIButton()
        loginbutton.setTitle("로그인", for: .normal)
        loginbutton.setTitleColor(.white, for: .normal)
        loginbutton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        loginbutton.backgroundColor = UIColor(named: "NoCheckButtonColor")
        loginbutton.layer.cornerRadius = 8
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
    let secondstackView: UIStackView = {
        let secondstackView = UIStackView()
        secondstackView.axis = .horizontal
        secondstackView.alignment = .firstBaseline
        secondstackView.spacing = 10
        secondstackView.translatesAutoresizingMaskIntoConstraints = false
        
        return secondstackView
    }()
    //각 버튼과 라벨 등의 커스텀 부분 및 타겟 지정
    
    func addView() {
        self.view.addSubview(dotoriimageview)
        self.view.addSubview(loginmainlabel)
        self.view.addSubview(loginsublabel)
        self.view.addSubview(loginfirtextfield)
        self.view.addSubview(loginsectextfield)
        self.view.addSubview(seekidbutton)
        self.view.addSubview(RePasswordbutton)
        self.view.addSubview(loginbutton)
        self.view.addSubview(firststackView)
        self.view.addSubview(secondstackView)
    }
    //addsubview 정리본
    
    
    
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
        loginfirtextfield.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(250)
            make.height.equalTo(52)
        }
        loginsectextfield.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(323)
            make.height.equalTo(52)
        }
        firststackView.snp.makeConstraints{ make in
            make.leading.equalTo(195)
            make.top.equalTo(loginsectextfield.snp.bottom).offset(24)
        }
        secondstackView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(103)
            make.bottom.equalTo(loginbutton.snp.top).inset(-36)
        }
        loginbutton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(view.safeAreaInsets).inset(24)
            make.height.equalTo(52)
        }
    }
    //각 버튼이나 라벨 등의 위치 설정부분
}
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
                loginbutton.addTarget(self, action: #selector(secondscreen), for: .touchUpInside)
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
                loginbutton.addTarget(self, action: #selector(secondscreen), for: .touchUpInside)
            }
        }
    }
}
