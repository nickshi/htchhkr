//
//  RoundImageView.swift
//  htchhkr
//
//  Created by nick.shi on 3/2/18.
//  Copyright © 2018 nick.shi. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
