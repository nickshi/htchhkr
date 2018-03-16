//
//  Alertable.swift
//  htchhkr
//
//  Created by nick.shi on 3/15/18.
//  Copyright © 2018 nick.shi. All rights reserved.
//

import UIKit

protocol Alertable {}

extension Alertable where Self: UIViewController{
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Error:", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
