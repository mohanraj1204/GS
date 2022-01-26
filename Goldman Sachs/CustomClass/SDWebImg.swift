//
//  SDWebImg.swift
//  Goldman Sachs
//
//  Created by Mohanraj on 26/01/22.
//

import Foundation
import SDWebImage
import UIKit

extension UIImageView {
       func setImageFrom(urlStr url: String){
        self.backgroundColor = .gray
            self.contentMode = .scaleAspectFill
           self.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
        }
}
