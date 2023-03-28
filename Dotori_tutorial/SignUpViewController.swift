//
//  SignUpViewController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/03/28.
//
import UIKit
import SnapKit
class SignUpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        //전체 addSubView함수
        location()
        //전체 위치 선정 함수
    }
    
    @objc func dissmissViewController() {
        dismiss(animated: true, completion: nil)
    }
    //dismiss 활용
    
    
    let MainLabel: UILabel = {
        let ML = UILabel()
        ML.text = "회원가입"
        ML.textColor = .black
        ML.font = UIFont.boldSystemFont(ofSize: 17)
        return ML
    }()
    let BigLabel: UILabel = {
        let BL = UILabel()
        BL.text = "회원가입"
        BL.textColor = .systemGray
        BL.font = UIFont.systemFont(ofSize: 20)
        return BL
    }()
    //각 버튼과 라벨 등의 커스텀 부분
    
    
    
    func addView() {
        self.view.addSubview(MainLabel)
        self.view.addSubview(BigLabel)
    }
    //addSubView 정리본
    
    
    
    
    func location() {
        MainLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(180)
            make.top.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        BigLabel.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
        }
    }
    //위치 설정 정리본
}
