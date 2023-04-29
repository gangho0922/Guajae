//
//  OriginColorButton.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/04/07.
//

import UIKit

class OriginColorButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
    func commoninit() {
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        backgroundColor = .buttonColor
        layer.cornerRadius = 8
    }
}
