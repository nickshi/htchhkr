//
//  RoundedTextField.swift
//  htchhkr
//
//  Created by nick.shi on 3/5/18.
//  Copyright © 2018 nick.shi. All rights reserved.
//

import UIKit

class RoundedTextField: UITextField {

    var textRectOffset: CGFloat = 20
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
       return bounds.insetBy(dx: textRectOffset, dy: textRectOffset / 2)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: textRectOffset, dy: textRectOffset / 2)
    }

}
