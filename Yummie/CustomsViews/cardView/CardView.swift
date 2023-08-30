//
//  CardView.swift
//  Yummie
//
//  Created by nassermac on 8/21/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import UIKit

class CardView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
        setUp()
    }
    private func setUp(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        cornerRedius = 10
    }
}
