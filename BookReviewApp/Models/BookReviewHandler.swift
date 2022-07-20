//
//  BookReviewHandler.swift
//  BookReviewApp
//
//  Created by Yahya Emad on 18/07/2022.
//

import Foundation
import UIKit


struct BookReviewHandler{
    
    static var Books = [MyBookReviewModel]()
    
    static func loadLatestBooks(completionHandler: @escaping ([MyBookReviewModel]?, Error?) -> Void){
        
        guard let url = URL(string: "https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=w9bLwUBUEb7Etd7IEGYbvOB1tUfAlEZs") else{
            print("Invalid URL!")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let safeData = data else{
                print("There is no data found!")
                completionHandler(nil, error!)
                return
            }
            
            let decoder = JSONDecoder()
            do{
                let BookList = try decoder.decode(AllBooksModel.self, from: safeData)
                let bookLists = BookList.results.lists
                
                for bookItem in bookLists{
                    let books = bookItem.books
                    
                    for book in books{
                        var singleBookData = MyBookReviewModel(title: book.title, author: book.author, price: book.price, description: book.description, dateCreated: book.created_date, purchaseURLs: [book.buy_links[0].url, book.buy_links[1].url], imageURL: book.book_image)
                        Books.append(singleBookData)
                    }
                }

                completionHandler(Books, nil)
            }catch{
                print("Failure in decoding data!")
                completionHandler(nil, error)
            }
        }
        
        task.resume()
    }
    
    static func fetchBookImage(For currentBook: MyBookReviewModel, completionHandler: @escaping(UIImage?, Error?) -> Void){
        guard let imageURL = URL(string: currentBook.imageURL) else{
            print("Invalid URL!")
            return
        }
        
        let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
            
            guard let safeImageData = data else{
                print("Invalid Image data!")
                completionHandler(nil, error)
                return
            }
            
            guard let bookImage = UIImage(data: safeImageData) else{
                print("Invalid Conversion of data to image!")
                completionHandler(nil, error)
                return
            }
            
            completionHandler(bookImage, nil)
        
        }
        
        task.resume()
        
        
    }
}
