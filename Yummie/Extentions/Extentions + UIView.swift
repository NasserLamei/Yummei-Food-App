//
//  Extentions + UIView.swift
//  Yummie
//
//  Created by nassermac on 8/10/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import UIKit

extension UIView{
    
   @IBInspectable var cornerRedius: CGFloat{
    get{return self.cornerRedius}
        set {self.layer.cornerRadius = newValue}
    }
    
    
    
}
