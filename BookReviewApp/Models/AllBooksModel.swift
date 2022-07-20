//
//  AllBooksModel.swift
//  BookReviewApp
//
//  Created by Yahya Emad on 18/07/2022.
//

import Foundation

struct AllBooksModel: Codable{
    let responseStatus: String //status
    let copyright: String
    let numberOfResults: Int //num_results
    let results: BookResult
    
    enum CodingKeys:String, CodingKey{
        case responseStatus = "status"
        case copyright = "copyright"
        case numberOfResults = "num_results"
        case results = "results"
    }
}


struct BookResult: Codable{
    let bestsellers_date: String
    let published_date: String
    let published_date_description: String
    let previous_published_date: String
    let next_published_date: String
    let lists: [BookList]
}

struct BookList: Codable{
    let list_id: Int
    let list_name: String
    let list_name_encoded: String
    let display_name: String
    let updated: String
    let list_image: String? //could be optional lets check
    let list_image_width: String? //could be optional lets check
    let list_image_height: String? //could be optional lets check
    let books: [Book]
}

struct Book: Codable{
    let age_group: String
    let amazon_product_url: String
    let article_chapter_link: String
    let author: String
    let book_image: String
    let book_image_width: Int
    let book_image_height: Int
    let book_review_link: String
    let book_uri: String
    let contributor: String
    let contributor_note: String
    let created_date: String
    let description: String
    let first_chapter_link: String
    let price: String
    let primary_isbn10: String
    let primary_isbn13: String
    let publisher: String
    let rank: Int
    let rank_last_week: Int
    let sunday_review_link: String
    let title: String
    let updated_date: String
    let weeks_on_list: Int
    let buy_links: [BuyLink]
}

struct BuyLink: Codable{
    let name: String
    let url: String
}
