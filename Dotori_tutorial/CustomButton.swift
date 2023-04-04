//
//  CustomButton.swift
//  Dotori_tutorial
//
//  Created by AnnKangHo on 2023/04/04.
//

import UIKit

class CustomButton: UIButton {
    
    private let nonClickableText = "아직 회원이 아니신가요?"
    private let clickableText = "회원가입"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let mutableAttributedString = NSMutableAttributedString(string: nonClickableText + clickableText)
        mutableAttributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: nonClickableText.count, length: clickableText.count))
        self.setAttributedTitle(mutableAttributedString, for: .normal)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let titleRect = self.titleRect(forContentRect: self.bounds)
        return titleRect.contains(point)
    }
}
