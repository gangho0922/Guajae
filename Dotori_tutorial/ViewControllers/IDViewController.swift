//
//  IDViewController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/03/28.
//

import UIKit
import SnapKit
class IDViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        //전체 addSubView함수
        location()
        //전체 위치 선정 함수
    }
    
    
    let BackButton: UIButton = {
        let BackButton = UIButton()
        BackButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        BackButton.contentVerticalAlignment = .fill
        BackButton.contentHorizontalAlignment = .fill
        BackButton.addTarget(self, action: #selector(dissmissViewController), for: .touchUpInside)
        BackButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return BackButton
    }()
    
    let CigLabel: UILabel = {
        let CigLabel = UILabel()
        CigLabel.text = "비밀번호 찾기"
        CigLabel.textColor = .systemGray
        CigLabel.font = UIFont.systemFont(ofSize: 20)
        return CigLabel
    }()
    //각 버튼과 라벨 등의 커스텀 부분
    
    
    
    @objc func dissmissViewController() {
        dismiss(animated: true, completion: nil)
    }
    //dismiss 활용
    
    func addView() {
        self.view.addSubview(BackButton)
        self.view.addSubview(CigLabel)
    }
    //addSubView 정리본
    
    
    func location() {
        BackButton.snp.makeConstraints{ make in
            make.leading.equalTo(20)
            make.top.equalToSuperview().inset(65)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        CigLabel.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
        }
    }
    
    //위치 설정 정리본
}
