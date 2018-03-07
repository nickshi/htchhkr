//
//  UIImageViewExt.swift
//  htchhkr
//
//  Created by nick.shi on 3/6/18.
//  Copyright © 2018 nick.shi. All rights reserved.
//

import UIKit

class UIImageViewExt: UIImageView {
    
    @IBInspectable var imageURL:String?
    
    override func awakeFromNib() {
        print("1122")
        if let imageURL =  imageURL{
            let url = URL(string: imageURL)
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            self.image = UIImage(data: data!)
        }
    }
    
    
}
