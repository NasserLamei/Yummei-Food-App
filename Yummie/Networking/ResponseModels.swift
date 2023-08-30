//
//  ResponseModel.swift
//  Yummie
//
//  Created by nassermac on 8/27/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import Foundation

struct MainResponse: Codable {
    let status: Int?
    let message: String?
    let data: DataObject?
}

struct DataObject: Codable {
    let categories: [DishCategory]
    let populars: [Dish]
    let specials: [Dish]
}


struct ResponseDish: Codable {
    let status: Int?
    let message: String?
    let data: [Dish]?
}


struct PlaceOrder: Codable {
    let status: Int?
    let message: String?
    let data: Orders?
}


struct AllOrders: Codable {
    let status: Int?
    let message: String?
    let data: [Orders]?
}
