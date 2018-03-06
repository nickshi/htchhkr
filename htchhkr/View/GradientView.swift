//
//  GradientView.swift
//  htchhkr
//
//  Created by nick.shi on 3/2/18.
//  Copyright © 2018 nick.shi. All rights reserved.
//

import UIKit

class GradientView: UIView {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupGradientView()
    }
    func setupGradientView() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.init(white: 1.0, alpha: 0.0).cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.locations = [0.8, 1.0]
        self.layer.addSublayer(gradient)
    }

}
