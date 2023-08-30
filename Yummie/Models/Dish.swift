//
//  Dish.swift
//  Yummie
//
//  Created by nassermac on 8/22/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import Foundation
struct Dish: Codable {
    let id,name,description,image: String?
    let calories: Int?
    
    
    var formattedCalories:String{
        return ("\(calories ?? 0) Calories")
    }
}
