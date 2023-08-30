//
//  String + Extention .swift
//  Yummie
//
//  Created by nassermac on 8/20/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import Foundation

extension String{
    
    var asUrl: URL?{
        return URL(string: self)
    }
}
