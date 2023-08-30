//
//  DishLandscapeCollectionViewCell.swift
//  Yummie
//
//  Created by nassermac on 8/22/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
//MARK:- Outlets.
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(dish: Dish){
        self.titleLabel.text = dish.name
        self.dishImageView.kf.setImage(with: dish.image?.asUrl)
        self.descriptionLabel.text = dish.description
        self.caloriesLabel.text = dish.formattedCalories
    }

}
