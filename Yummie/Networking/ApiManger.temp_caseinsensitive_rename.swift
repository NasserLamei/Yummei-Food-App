//
//  apiManger.swift
//  Yummie
//
//  Created by nassermac on 8/27/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import Foundation
import Alamofire

class ApiManger{
    static let shared = ApiManger()
    private init() {}
    
  func getDishCategoriesFromApi(completion:@escaping(_ error: Error? ,_ data: DataObject?)->Void){
        Alamofire.request(URLs.allCategories, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response {
            response in
            guard response.error == nil else{
                completion(response.error!,nil)
                return
            }
            guard let data = response.data else{
                return
            }
            do{
                let decoder = JSONDecoder()
                let responseAll = try decoder.decode(MainResponse.self, from: data)
                let dataObject = responseAll.data
                completion(nil, dataObject)
            }
            catch let error{
                completion(error, nil)
            }
        }
    }
    
 func fetchCatogriesDishes(id: String,completion:@escaping(_ error: Error? ,_ data: [Dish]?)->Void){
        Alamofire.request(URLs.categoriesDishies + (id), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response {
            response in
            guard response.error == nil else{
                completion(response.error!,nil)
                return
            }
            guard let data = response.data else{
                return
            }
            do{
                let decoder = JSONDecoder()
                let responseAll = try decoder.decode(ResponseDish.self, from: data)
                let dataObject = responseAll.data
                completion(nil, dataObject)
                
            }
            catch let error{
                completion(error, nil)
            }
        }
    }

    func placeOrderToApi(id:String, name:String, completion:@escaping(_ error: Error? ,_ massage: String?)->Void){
        let params = ["name" : name]
        Alamofire.request(URLs.placeOrder + (id), method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).response { response in
            guard (response.error == nil) else{
                completion(response.error!, nil)
                return
            }
            guard let data = response.data else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let responseOrder = try decoder.decode(PlaceOrder.self, from: data)
                let dataMassage = responseOrder.message
                completion(nil,dataMassage)
            } catch let error {
                completion(error,nil)

            }
        }
    }
    func fetchAllOrdersFromApi(completion:@escaping(_ error: Error? ,_ data: [Orders]?)->Void){
        Alamofire.request(URLs.placeOrder, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response {
            response in
            guard response.error == nil else{
                completion(response.error!,nil)
                return
            }
            guard let data = response.data else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let responseAll = try decoder.decode(AllOrders.self, from: data)
                let dataObject = responseAll.data
                completion(nil, dataObject)
            } catch let error{
                completion(error,nil)
            }
    }
    }
}
