//
//  CompleteController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/04/04.
//

import UIKit
import SnapKit

class CompleteViewController: UIViewController {
    let completelabel: UILabel = {
        let completelabel = UILabel()
        completelabel.text = "완료"
        completelabel.font = UIFont.boldSystemFont(ofSize: 32)
        return completelabel
    }()
    let sublabel: UILabel = {
        let sublabel = UILabel()
        sublabel.text = "회원가입이 완료되었습니다\n로그인을 이어서 진행해주세요!"
        sublabel.numberOfLines = 2
        sublabel.textAlignment = .center
        sublabel.font = UIFont.systemFont(ofSize: 16)
        return sublabel
    }()
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("로그인 하러가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.backgroundColor = UIColor(named: "ButtonColor")
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(completeviewcontroller), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationItem.title = "회원가입"
        addview()
        location()
    }
    
    @objc func completeviewcontroller() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func addview() {
        self.view.addSubview(completelabel)
        self.view.addSubview(sublabel)
        self.view.addSubview(button)
    }
    func location() {
        completelabel.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(278)
            make.centerX.equalToSuperview()
        }
        sublabel.snp.makeConstraints{ make in
            make.top.equalTo(completelabel.snp.bottom).inset(-32)
            make.centerX.equalToSuperview()
        }
        button.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(52)
        }
    }   
}
