//
//  Book.swift
//  DemoApp
//
//  Created by MAC on 27/10/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import Foundation

struct Book {
    let bookId: String
    let title: String
    let authors:[String]?
    let publishedDate: Date?
    let description: String?
    let coverURL: URL?
    let ratings: Float?
    let numberOfReviews: Int?
    let price: Float?
}
