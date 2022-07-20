//
//  BookTableViewCell.swift
//  BookReviewApp
//
//  Created by Yahya Emad on 19/07/2022.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    
    @IBOutlet weak var book1AuthorName: UILabel!
    @IBOutlet weak var book1Image: UIImageView!
    @IBOutlet weak var bookPrice: UILabel!
    @IBOutlet weak var reviewButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configureCell(forBook book: MyBookReviewModel, completionHnadler: @escaping(UIImage?, Error?) -> Void){
        BookReviewHandler.fetchBookImage(For: book){ (image, error) in
            DispatchQueue.main.async {
                guard let safeImage = image else{
                    print("There is no image fetched for that book!")
                    completionHnadler(nil, error)
                    return
                }
                self.book1Image.image = image
                completionHnadler(safeImage, nil)
            }
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func bookPressed(_ sender: UIButton) {
        print("Review \(BookReviewHandler.Books[sender.tag].title)!")
    }
    
    

}
