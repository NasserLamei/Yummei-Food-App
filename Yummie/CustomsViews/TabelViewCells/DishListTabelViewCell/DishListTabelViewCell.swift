//
//  DishListTabelViewCell.swift
//  Yummie
//
//  Created by nassermac on 8/24/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import UIKit


class DishListTabelViewCell: UITableViewCell {
  //MARK:- Outlets.
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
  
    
    func setUp(dish: Dish){
        self.dishImageView.kf.setImage(with: dish.image?.asUrl)
        self.titleLabel.text = dish.name
        self.descriptionLabel.text = dish.description
    }
    func setUp(order:Orders){
        self.dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        self.titleLabel.text = order.dish?.name
        self.descriptionLabel.text = order.name
    }

    
}
