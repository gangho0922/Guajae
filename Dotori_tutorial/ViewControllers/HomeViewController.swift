//
//  HomeViewController.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/03/28.
//

import UIKit
import SnapKit
class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "메인"
        view.backgroundColor = .white
        addView()
        //전체 addSubView 함수
        location()
        //전체 위치 설정 함수
    }
    
    
    

    let BigLabel: UILabel = {
        let BL = UILabel()
        BL.text = "메인"
        BL.textColor = .systemGray
        BL.font = UIFont.systemFont(ofSize: 20)
        return BL
    }()
    ///각 버튼과 라벨 등의 커스텀 부분
    
    
    
    
    
    func addView() {
        self.view.addSubview(BigLabel)
    }
    //addSubView 정리본
    
    
    
    
    
    func location() {
        BigLabel.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
        }
    }
    //각 버튼이나 라벨들의 위치 설정부분
}
