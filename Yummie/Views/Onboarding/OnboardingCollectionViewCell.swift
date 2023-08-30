//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by nassermac on 8/10/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slidetitleLabel: UILabel!
    @IBOutlet weak var slidedesLabel: UILabel!
 
    
    func setUp(_ slide: OnboardingSlide){
        self.slideImageView.image = slide.image
        self.slidetitleLabel.text = slide.title
        self.slidedesLabel.text = slide.description
        }
}
