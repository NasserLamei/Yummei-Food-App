//
//  CollectionViewCell.swift
//  Yummie
//
//  Created by nassermac on 8/20/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//
//
import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!

    func setUp(category: DishCategory){
        self.categoryTitleLabel.text = category.title
        self.categoryImageView.kf.setImage(with: category.image?.asUrl)
    }

}
