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
    
    
    let CackCutton: UIButton = {
        let CC = UIButton()
        CC.setImage(UIImage(systemName: "xmark"), for: .normal)
        CC.contentVerticalAlignment = .fill
        CC.contentHorizontalAlignment = .fill
        CC.addTarget(self, action: #selector(dissmissViewController), for: .touchUpInside)
        CC.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return CC
    }()
    
    let CigLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 찾기"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    //각 버튼과 라벨 등의 커스텀 부분
    
    
    
    @objc func dissmissViewController() {
        dismiss(animated: true, completion: nil)
    }
    //dismiss 활용
    
    
    
    func addView() {
        self.view.addSubview(CackCutton)
        self.view.addSubview(CigLabel)
    }
    //addSubView 정리본
    
    
    func location() {
        CackCutton.snp.makeConstraints{ make in
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
