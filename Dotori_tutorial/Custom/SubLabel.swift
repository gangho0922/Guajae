//
//  SubLabel.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/04/06.
//

import UIKit

class SubLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
    func commoninit() {
        textColor = .black
        font = .systemFont(ofSize: 12)
    }
}
