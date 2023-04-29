//
//  AuthHeaderCustomView.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/04/05.
//

import UIKit
import SnapKit

class AuthHeaderCustomView: UIView {
    let dotoriimageview: UIImageView = {
        let DI = UIImageView()
        DI.image = UIImage(named: "Dotori_Icon")
        
        return DI
    }()
    let mainlabel: UILabel = {
        let mainlabel = UILabel()
        mainlabel.text = "Dotori"
        mainlabel.textColor = .black
        mainlabel.font = UIFont.boldSystemFont(ofSize: 32)
        return mainlabel
    }()
    private let sublabel: UILabel = {
        let sublabel = UILabel()
        sublabel.textColor = .black
        sublabel.font = .systemFont(ofSize: 16)
        return sublabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        location()
    }
    init(description: String) {
        super.init(frame: .zero)
        sublabel.text = description
        commonInit()
        location()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        location()
    }
    private func commonInit(){
        addSubview(mainlabel)
        addSubview(sublabel)
        addSubview(dotoriimageview)
    }
    private func location(){
        dotoriimageview.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(safeAreaInsets).offset(121)
            make.height.equalTo(48)
            make.width.equalTo(48)
        }
        mainlabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(85)
            make.top.equalTo(safeAreaInsets).offset(131)
            make.height.equalTo(26)
        }
        sublabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(mainlabel.snp.bottom).inset(-20)
            make.height.equalTo(26)
        }
    }
}
