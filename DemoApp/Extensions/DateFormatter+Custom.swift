//
//  DateFormatter+Custom.swift
//  DemoApp
//
//  Created by MAC on 28/10/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import Foundation

extension DateFormatter{
    
    static let booksAPIDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
        
    }()
}
//Se crea static para usarlo de esta forma y no estar crean una variable
//DateFormatter.booksAPIDateFormatter

