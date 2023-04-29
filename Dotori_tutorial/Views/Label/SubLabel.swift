//
//  SubLabel.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/04/06.
//

import UIKit

class SubLabel: UILabel {
    
    let sublabel: UILabel = {
        let sublabel = UILabel()
        sublabel.textColor = .black
        sublabel.font = .systemFont(ofSize: 12)
        return sublabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
        location()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
        location()
    }
    init(description: String) {
        super.init(frame: .zero)
        sublabel.text = description
        commoninit()
        location()
    }
    func commoninit() {
        addSubview(sublabel)
    }
    func location(){
        sublabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(safeAreaLayoutGuide).inset(112)
            make.height.equalTo(26)
        }
    }
}
