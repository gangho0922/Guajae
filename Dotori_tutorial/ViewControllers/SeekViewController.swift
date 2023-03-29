//
//  SeekViewController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/03/28.
//

import UIKit
import SnapKit
class SeekViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        //전체 addSubView 함수
        location()
        //전체 위치 선정 함수
    }
    
    
    
    
    let BackToButton: UIButton = {
        let BBB = UIButton()
        BBB.setImage(UIImage(named: "Dismiss_x"), for: .normal)
        BBB.contentVerticalAlignment = .fill
        BBB.contentHorizontalAlignment = .fill
        BBB.addTarget(self, action: #selector(dissmissViewController), for: .touchUpInside)
        BBB.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return BBB
    }()
    
    let BigLabelBig: UILabel = {
        let BLB = UILabel()
        BLB.text = "아이디 찾기"
        BLB.textColor = .systemGray
        BLB.font = UIFont.systemFont(ofSize: 20)
        return BLB
    }()
    //각 버튼과 라벨 등의 커스텀 부분
    
    
    
    @objc func dissmissViewController() {
        dismiss(animated: true, completion: nil)
    }
    //dismiss 활용
    
    
    
    
    func addView() {
        self.view.addSubview(BackToButton)
        self.view.addSubview(BigLabelBig)
    }
    //addSubView 정리본
    
    
    
    
    
    func location() {
        BackToButton.snp.makeConstraints{ make in
            make.leading.equalTo(20)
            make.top.equalToSuperview().inset(65)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        BigLabelBig.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
        }
    }
    //위치 선정 정리본
}
