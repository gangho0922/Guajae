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
        ///전체 addSubView 함수
        addView()
        ///전체 위치 선정 함수
        location()
    }
    
    //각 버튼과 라벨 등의 커스텀 부분
    let BackToButton: UIButton = {
        let BackToButton = UIButton()
        BackToButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        BackToButton.contentVerticalAlignment = .fill
        BackToButton.contentHorizontalAlignment = .fill
        BackToButton.addTarget(self, action: #selector(dissmissViewController), for: .touchUpInside)
        BackToButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return BackToButton
    }()
    
    let BigLabel: UILabel = {
        let BigLabel = UILabel()
        BigLabel.text = "아이디 찾기"
        BigLabel.textColor = .systemGray
        BigLabel.font = UIFont.systemFont(ofSize: 20)
        return BigLabel
    }()
    
    ///dismiss 활용
    @objc func dissmissViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    ///addSubView 정리본
    func addView() {
        self.view.addSubview(BackToButton)
        self.view.addSubview(BigLabel)
    }
    //위치 선정 정리본
    func location() {
        BackToButton.snp.makeConstraints{ make in
            make.leading.equalTo(20)
            make.top.equalToSuperview().inset(65)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        BigLabel.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
        }
    }
}
