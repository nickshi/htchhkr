//
//  UIViewControllerExt.swift
//  htchhkr
//
//  Created by nick.shi on 3/9/18.
//  Copyright © 2018 nick.shi. All rights reserved.
//

import UIKit

extension UIViewController {
    func shouldPresentLoadingView(status: Bool) {
        var fadeView: UIView?
        
        if status == true {
            fadeView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
            fadeView?.backgroundColor = UIColor.black
            fadeView?.alpha = 0.0
            fadeView?.tag = 99
            
            let spinner = UIActivityIndicatorView()
            spinner.color = UIColor.white
            spinner.activityIndicatorViewStyle = .whiteLarge
            spinner.center = view.center
            
            view.addSubview(fadeView!)
            spinner.startAnimating()
            fadeView?.addSubview(spinner)
            fadeView?.fadeto(alphaValue: 0.7, withDuratiion: 0.2)
        } else {
            for subview in view.subviews {
                if subview.tag == 99 {
                    subview.fadeto(alphaValue: 0.0, withDuratiion: 0.2, completion: { (finished) in
                        subview.removeFromSuperview()
                    })
                }
            }
        }
    }
}
