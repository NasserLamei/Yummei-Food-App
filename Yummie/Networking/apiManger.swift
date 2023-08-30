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
    
  class func getData(){
        Alamofire.request("https://yummie.glitch.me/dish-categories", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response {
            response in
            guard response.error == nil else{
                print(response.error!)
                return
            }
            guard let data = response.data else{
                print("I can not found Data")
                return
            }
            do{
                let decoder = JSONDecoder()
                let Arr = try? decoder.decode(Response.self, from: data)
            }
        }
    }
    
    
    
}
