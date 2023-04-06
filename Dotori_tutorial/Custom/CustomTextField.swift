//
//  CustomTextField.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/04/06.
//

import UIKit

class CustomTextField: UITextField {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
    func commoninit() {
        backgroundColor = .white
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 8
        leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        leftViewMode = .always
    }
}
