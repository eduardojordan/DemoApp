//
//  BookCollection.swift
//  DemoApp
//
//  Created by MAC on 28/10/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import Foundation


struct BookCollection {
    let kind : String
    let totalItems: Int
    let item:[Book]?
}

extension BookCollection: Decodable{
    
}
