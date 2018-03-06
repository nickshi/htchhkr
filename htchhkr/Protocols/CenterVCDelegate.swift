//
//  CenterVCDelegate.swift
//  htchhkr
//
//  Created by nick.shi on 3/2/18.
//  Copyright © 2018 nick.shi. All rights reserved.
//

import UIKit

protocol CenterVCDelegate {
    func toggleLeftPanel()
    func addLeftPanelViewController()
    func animateLeftPanel(shouldExpand: Bool)
}

