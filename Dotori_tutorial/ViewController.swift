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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addView()
        //전체 addSubView 함수
        location()
        //전체 위치 설정 함수
        ShownPassword()
        //안보이게 버튼 커스텀
        eyeButton.addTarget(self, action: #selector(eyeButtonDidTap(_:)), for: .touchUpInside)
        // 안보이게 버튼을 활성화하기 위해 selector로 eyeButtonDidTap 지정
    }
    
    
    
    @objc func secondscreen() {
        let SEC = HomeViewController()
        navigationController?.setViewControllers([SEC], animated: true)
    }
    //set 활용 전환 방법
    @objc func signupscreen() {
        let GOSIGNUP = SignUpViewController()
        navigationController?.pushViewController(GOSIGNUP, animated: true)
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
        Login_Second_TextField.isSecureTextEntry = isSecurePassword
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        self.eyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye" : "eye.fill"), for: .normal)
        self.eyeButton.configuration = buttonConfiguration

        self.Login_Second_TextField.rightView = eyeButton
        
        self.Login_Second_TextField.rightViewMode = .always
    }
    
    @objc func eyeButtonDidTap(_ sender: UIButton) {
        isSecurePassword.toggle()
        self.eyeButton.setImage(UIImage(systemName: isSecurePassword ? "eye" : "eye.fill"), for: .normal)
        Login_Second_TextField.isSecureTextEntry = isSecurePassword
    }
    //비밀번호 안보이거나 보이게 하는 부분
    
    
    
    
    
    let TitleLabel: UILabel = {
        let TL = UILabel()
        TL.text = "로그인"
        TL.textColor = .black
        TL.font = UIFont.boldSystemFont(ofSize: 17)
        return TL
    }()
    let Dotori_Image: UIImageView = {
        let DI = UIImageView()
        DI.image = UIImage(named: "Dotori_Icon")
        
        return DI
    }()
    let Login_Title_Text: UILabel = {
        let LTT = UILabel()
        LTT.text = "Dotori"
        LTT.textColor = .black
        LTT.font = UIFont.boldSystemFont(ofSize: 32)
        return LTT
    }()
    let Login_Sub_Text: UILabel = {
        let LST = UILabel()
        LST.text = "더 편한 기숙사 생활을 위해"
        LST.textColor = .black
        LST.font = .systemFont(ofSize: 16)
        return LST
    }()
    let Login_First_TextField: UITextField = {
        let LFT = UITextField()
        LFT.backgroundColor = .white
        LFT.layer.borderColor = UIColor.black.cgColor
        LFT.layer.borderWidth = 1.0
        LFT.layer.cornerRadius = 8
        LFT.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        LFT.leftViewMode = .always
        LFT.placeholder = "로그인"
        return LFT
    }()
    let Login_Second_TextField: UITextField = {
        let LS = UITextField()
        LS.backgroundColor = .white
        LS.layer.borderColor = UIColor.black.cgColor
        LS.layer.borderWidth = 1.0
        LS.layer.cornerRadius = 8
        LS.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        LS.leftViewMode = .always
        LS.placeholder = "비밀번호"
        return LS
    }()
    
    let SeekId: UIButton = {
        let SI = UIButton()
        SI.setTitle("아이디 찾기    |", for: .normal)
        SI.setTitleColor(.systemGray, for: .normal)
        SI.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        SI.addTarget(target, action: #selector(presentViewController), for: .touchUpInside)
        return SI
    }()
    
    let RePassword: UIButton = {
        let RP = UIButton()
        RP.setTitle("비밀번호 재설정", for: .normal)
        RP.setTitleColor(.systemGray, for: .normal)
        RP.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        RP.addTarget(target, action: #selector(seeViewController), for: .touchUpInside)
        return RP
    }()
    
    let NOCustomer: UILabel = {
        let NC = UILabel()
        NC.text = "아직 회원이 아니신가요?"
        NC.textColor = .systemGray
        NC.font = UIFont.boldSystemFont(ofSize: 12.0)
        return NC
    }()
    let SignIn: UIButton = {
        let SI = UIButton()
        SI.setTitle("회원가입", for: .normal)
        SI.setTitleColor(.black, for: .normal)
        SI.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
        SI.addTarget(target, action: #selector(signupscreen), for: .touchUpInside)
        return SI
    }()
    let LogIn: UIButton = {
        let LI = UIButton()
        LI.setTitle("로그인", for: .normal)
        LI.setTitleColor(.white, for: .normal)
        LI.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        LI.backgroundColor = UIColor(named: "ButtonColor")
        LI.layer.cornerRadius = 8
        LI.addTarget(target, action: #selector(secondscreen), for: .touchUpInside)
        return LI
    }()
    //각 버튼과 라벨 등의 커스텀 부분 및 타겟 지정
    
    
    
    func addView() {
        self.view.addSubview(TitleLabel)
        self.view.addSubview(Dotori_Image)
        self.view.addSubview(Login_Title_Text)
        self.view.addSubview(Login_Sub_Text)
        self.view.addSubview(Login_First_TextField)
        self.view.addSubview(Login_Second_TextField)
        self.view.addSubview(SeekId)
        self.view.addSubview(RePassword)
        self.view.addSubview(NOCustomer)
        self.view.addSubview(SignIn)
        self.view.addSubview(LogIn)
    }
    //addsubview 정리본
    
    
    
    func location() {
        TitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(175)
            make.top.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        
        Dotori_Image.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(120)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        Login_Title_Text.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(85)
            make.top.equalToSuperview().inset(120)
            make.height.equalTo(50)
        }
        Login_Sub_Text.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(170)
            make.height.equalTo(50)
        }
        Login_First_TextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(250)
            make.height.equalTo(52)
        }
        Login_Second_TextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(323)
            make.height.equalTo(52)
        }
        SeekId.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(200)
            make.top.equalToSuperview().inset(380)
            make.height.equalTo(52)
        }
        RePassword.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(285)
            make.top.equalToSuperview().inset(380)
            make.height.equalTo(52)
        }
        NOCustomer.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(100)
            make.top.equalToSuperview().inset(680)
            make.height.equalTo(52)
        }
        SignIn.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(220)
            make.top.equalToSuperview().inset(680)
            make.height.equalTo(52)
        }
        LogIn.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(750)
            make.height.equalTo(52)
        }
    }
    //각 버튼이나 라벨 등의 위치 설정부분
}
