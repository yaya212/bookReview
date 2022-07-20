//
//  ViewController.swift
//  BookReviewApp
//
//  Created by Yahya Emad on 18/07/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var booksTable: UITableView!
    let refreshControl = UIRefreshControl()
    var Books = [MyBookReviewModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchBooks()
        
        self.booksTable.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshContent), for: .valueChanged)
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear!")
        
        
    }
    
    
    @objc func refreshContent(){

        print("RefreshReached!")
        Books = []
        fetchBooks()
        
        
    }
    

    
    func fetchBooks(){
        BookReviewHandler.loadLatestBooks(){ (books, error) in
            
            guard let safeBooks = books else{
                return
            }
            
            self.Books = safeBooks
            self.Books.shuffle()
            
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.booksTable.reloadData()
            }

        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBookDetails"{
            let bookDetailsVC = segue.destination as! BookDetailsViewController
            
            if let sender = sender as? UIButton {
                bookDetailsVC.bookTitle = Books[sender.tag].title
                bookDetailsVC.bookImage = Books[sender.tag].picture
                bookDetailsVC.bookDescription = Books[sender.tag].description
                bookDetailsVC.dateCreated = Books[sender.tag].dateCreated
                bookDetailsVC.purchaseURL1 = Books[sender.tag].purchaseURLs[0]
                bookDetailsVC.purchaseURL2 = Books[sender.tag].purchaseURLs[1]
            }
            
        }
    }
    
    
    //MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("Book count:\n\(Int(round(Double(Books.count) / 2.0)))")
        return Int(round(Double(Books.count) / 2.0))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if Books.isEmpty{
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
        cell.book1Image.image = Books[indexPath.row].picture
        cell.book1AuthorName.text = "By: " + Books[indexPath.row].author
        cell.bookPrice.text = "Price: $" + Books[indexPath.row].price
        cell.reviewButton.tag = indexPath.row
        cell.configureCell(forBook: Books[indexPath.row]){ (image, error) in
            if let safeImage = image{
                self.Books[indexPath.row].picture = safeImage
            }
            
        }
        
        return cell
        
    }
}

