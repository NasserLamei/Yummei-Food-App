//
//  Constant.swift
//  Yummie
//
//  Created by nassermac on 8/29/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import Foundation

//MARK: - StoryBoards
struct StoryBoards {
    static let main: String = "Main"
}

//MARK: - Views
struct Views {
    static let onboarding: String = "homeNC"
    static let home: String = "homeVC"
    static let dishDetails: String = "DishDetailViewController"
    static let listDishes: String = "ListDishesViewController"
    static let listOrders: String = "ListOrdersViewController"
}
//MARK: - Cells
struct Cells {
    static let dishLandscapeCell: String = "DishLandscapeCollectionViewCell"
    static let dishPortraitCell: String = "DishPortraitCollectionViewCell"
    static let categoryCell: String = "CategoryCollectionViewCell"
    static let dishListCell: String = "DishListTabelViewCell"
    static let onboardingCell: String = "OnboardingCollectionViewCell"
}
//MARK: - UserDefaults
struct UserDefaultsKeys {
    static let isLoggedIn: String = "isLoggedIn"
}
//MARK: - URLs
struct URLs {
    static let base = "https://yummie.glitch.me"
    static let allCategories = base + "/dish-categories"
    static let categoriesDishies = base + "/dishes/"
    static let placeOrder = base + "/orders/"
}
