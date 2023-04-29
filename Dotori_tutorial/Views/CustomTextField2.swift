//
//  CustomTextField2.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/04/06.
//

import UIKit

class CustomTextField2: UITextField {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
    func commoninit() {
        
    }
}
