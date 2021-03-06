//
//  UIViewExt.swift
//  htchhkr
//
//  Created by nick.shi on 3/5/18.
//  Copyright © 2018 nick.shi. All rights reserved.
//

import UIKit


extension UIView {
    func fadeto(alphaValue: CGFloat, withDuratiion duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = alphaValue
        }
    }
    
    func fadeto(alphaValue: CGFloat, withDuratiion duration: TimeInterval, completion: @escaping (Bool) ->()) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = alphaValue
        }) { (finished) in
            completion(finished)
        }
    }
    
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification: NSNotification) {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let curFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let targetFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = targetFrame.origin.y - curFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
