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
    let rating: Float?
    let numberOfReviews: Int?
    let price: Float?
}

extension Book: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case bookId = "id"
        case volumeInfo
        case title
        case authors
        case publishedDate
        case description
        case imageLinks
        case coverURL = "thumbnail"
        case rating = "averageRating"
        case numberOfReview = "ratingsCount"
        case saleInfo
        case listPrice
        case price = "amount"
    }
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // BOOKID
        bookId = try container.decode(String.self, forKey: .bookId)
        
        let volumeInfoContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .volumeInfo)
        // TITLE
        title = try volumeInfoContainer.decode(String.self, forKey: .title)
        
        // AUTHORS
        // Decode optional properties (decodeIfPresent)
        authors = try volumeInfoContainer.decodeIfPresent([String].self, forKey: .authors)
        
        // PUBLISHEDDATE
        if let publishedDateString = try volumeInfoContainer.decodeIfPresent(String.self, forKey: .publishedDate){
            publishedDate = DateFormatter.booksAPIDateFormatter.date(from: publishedDateString)
        }else{
            publishedDate = nil
        }
        
        // DESCRIPTION
        description = try volumeInfoContainer.decodeIfPresent(String.self, forKey: .description)
        
        //COVERURL
        do{
            let imageLinkContainer = try volumeInfoContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .imageLinks)
            coverURL = try imageLinkContainer.decodeIfPresent(URL.self, forKey: .coverURL)
        }catch {
            coverURL = nil
        }
        
        // RATING
        rating = try volumeInfoContainer.decodeIfPresent(Float.self, forKey: .rating)
        
        // NUMBEROFREVIEWS
        numberOfReviews = try volumeInfoContainer.decodeIfPresent(Int.self, forKey: .numberOfReview)
        
        // PRICE
        let saleInfoContainer = try? container.nestedContainer(keyedBy: CodingKeys.self, forKey: .saleInfo)
        let listPriceContainer = try? saleInfoContainer?.nestedContainer(keyedBy: CodingKeys.self, forKey: .listPrice)
        price = try listPriceContainer?.decodeIfPresent(Float.self, forKey: .price)
    }
    
}
