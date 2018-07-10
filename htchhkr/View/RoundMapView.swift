//
//  RoundMapView.swift
//  htchhkr
//
//  Created by nick.shi on 3/15/18.
//  Copyright © 2018 nick.shi. All rights reserved.
//

import UIKit
import MapKit

class RoundMapView: MKMapView {
    
    override func awakeFromNib() {
        setupView()
    }
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderColor = UIColor.white.cgColor
        //self.layer.borderColor = 10.0
    }

}
